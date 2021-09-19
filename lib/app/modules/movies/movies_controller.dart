import 'package:get/get.dart';

import '../../core/ui/messages/messages_mixin.dart';
import '../../data/models/genre.dart';
import '../../data/models/message.dart';
import '../../data/models/movie.dart';
import '../../data/services/auth/auth_service.dart';
import '../../data/services/genres/i_genres_service.dart';
import '../../data/services/movies/i_movies_service.dart';

class MoviesController extends GetxController with MessagesMixin {
  final IGenresService _genresService;
  final IMoviesService _moviesService;
  final AuthService _authService;

  final _message = Rxn<Message>();

  final genres = <Genre>[].obs;
  final popularMovies = <Movie>[].obs;
  final topRatedMovies = <Movie>[].obs;

  var _popularMoviesOriginal = <Movie>[];
  var _topRatedMoviesOriginal = <Movie>[];

  final selectedGenre = Rxn<Genre>();

  MoviesController({
    required IGenresService genresService,
    required IMoviesService moviesService,
    required AuthService authService,
  })  : _genresService = genresService,
        _moviesService = moviesService,
        _authService = authService;

  @override
  void onInit() {
    super.onInit();

    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      final genresData = await _genresService.getGenres();
      genres.assignAll(genresData);

      await getMovies();
    } catch (err) {
      print('err: $err');
      _message(
        Message.error(
          title: 'Erro',
          message: 'Erro ao carregar dados da página.',
        ),
      );
    }
  }

  Future<void> getMovies() async {
    try {
      var popularMoviesData = await _moviesService.getPopularMovies();
      var topRatedMoviesData = await _moviesService.getTopRated();
      final favorites = await getFavorites();

      popularMoviesData = popularMoviesData.map((movie) {
        if (favorites.containsKey(movie.id)) {
          return movie.copyWith(favorite: true);
        } else {
          return movie.copyWith(favorite: false);
        }
      }).toList();

      topRatedMoviesData = topRatedMoviesData.map((movie) {
        if (favorites.containsKey(movie.id)) {
          return movie.copyWith(favorite: true);
        } else {
          return movie.copyWith(favorite: false);
        }
      }).toList();

      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMoviesData;

      topRatedMovies.assignAll(topRatedMoviesData);
      _topRatedMoviesOriginal = topRatedMoviesData;
    } catch (err) {
      print('err: $err');
      _message(
        Message.error(
          title: 'Erro',
          message: 'Erro ao carregar dados da página.',
        ),
      );
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      final newPopularMovies = _popularMoviesOriginal.where(
        (movie) => movie.title.toLowerCase().contains(
              title.toLowerCase(),
            ),
      );

      popularMovies.assignAll(newPopularMovies);

      final newTopRatedMovies = _topRatedMoviesOriginal.where(
        (movie) => movie.title.toLowerCase().contains(
              title.toLowerCase(),
            ),
      );

      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  void filterMoviesByGenre(Genre? genre) {
    if (genre?.id == selectedGenre.value?.id) {
      genre = null;
    }

    selectedGenre.value = genre;

    if (genre != null) {
      final newPopularMovies = _popularMoviesOriginal.where(
        (movie) => movie.genres.contains(genre?.id),
      );

      popularMovies.assignAll(newPopularMovies);

      final newTopRatedMovies = _topRatedMoviesOriginal.where(
        (movie) => movie.genres.contains(genre?.id),
      );

      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  Future<void> favoriteMovie(Movie movie) async {
    final user = _authService.user;

    if (user != null) {
      final newMovie = movie.copyWith(favorite: !movie.favorite);

      await _moviesService.addOrRemoveFavorite(user.uid, newMovie);
      await getMovies();
    }
  }

  Future<Map<int, Movie>> getFavorites() async {
    final user = _authService.user;

    if (user != null) {
      final favorites = await _moviesService.getFavoritesMovies(user.uid);

      return <int, Movie>{
        for (var fav in favorites) fav.id: fav,
      };
    }

    return {};
  }
}
