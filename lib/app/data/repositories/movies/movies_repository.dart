import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './i_movies_repository.dart';
import '../../models/movie.dart';
import '../../models/movie_detail.dart';
import '../../services/api/rest_client.dart';

class MoviesRepository implements IMoviesRepository {
  final RestClient _restClient;

  MoviesRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<Movie>> getPopularMovies() async {
    final response = await _restClient.get<List<Movie>>(
      '/movie/popular',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final responseData = data['results'];

        if (responseData != null) {
          return responseData
              .map<Movie>((movie) => Movie.fromMap(movie))
              .toList();
        }

        return <Movie>[];
      },
    );

    if (response.hasError) {
      print('response.hasError: ${response.statusText}');
      throw Exception('Erro ao buscar filmes populares.');
    }

    return response.body ?? <Movie>[];
  }

  @override
  Future<List<Movie>> getTopRated() async {
    final response = await _restClient.get<List<Movie>>(
      '/movie/top_rated',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final responseData = data['results'];

        if (responseData != null) {
          return responseData
              .map<Movie>((movie) => Movie.fromMap(movie))
              .toList();
        }

        return <Movie>[];
      },
    );

    if (response.hasError) {
      print('response.hasError: ${response.statusText}');
      throw Exception('Erro ao buscar filmes populares.');
    }

    return response.body ?? <Movie>[];
  }

  @override
  Future<MovieDetail?> getDetail(int id) async {
    final response = await _restClient.get<MovieDetail?>(
      '/movie/$id',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'append_to_response': 'images,credits',
        'include_image_language': 'en,pt-br',
      },
      decoder: (data) {
        return MovieDetail.fromMap(data);
      },
    );

    if (response.hasError) {
      print('response.hasError: ${response.statusText}');
      throw Exception('Erro ao buscar detalhes do filme.');
    }

    return response.body;
  }

  @override
  Future<void> addOrRemoveFavorite(String userId, Movie movie) async {
    try {
      final favoriteCollection = FirebaseFirestore.instance
          .collection('favorites')
          .doc(userId)
          .collection('movies');

      if (movie.favorite) {
        favoriteCollection.add(movie.toMap());
      } else {
        final favoriteData = await favoriteCollection
            .where('id', isEqualTo: movie.id)
            .limit(1)
            .get();

        await favoriteData.docs.first.reference.delete();
      }
    } catch (err) {
      print('err: $err');
      rethrow;
    }
  }

  @override
  Future<List<Movie>> getFavoritesMovies(String userId) async {
    final favoritesMovies = await FirebaseFirestore.instance
        .collection('favorites')
        .doc(userId)
        .collection('movies')
        .get();

    final listFavorites = <Movie>[];

    for (var movie in favoritesMovies.docs) {
      listFavorites.add(Movie.fromMap(movie.data()));
    }

    return listFavorites;
  }
}
