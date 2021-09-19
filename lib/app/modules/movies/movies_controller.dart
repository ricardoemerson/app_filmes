import 'package:get/get.dart';

import '../../core/ui/messages/messages_mixin.dart';
import '../../data/models/genre.dart';
import '../../data/models/message.dart';
import '../../data/models/movie.dart';
import '../../data/services/genres/i_genres_service.dart';
import '../../data/services/movies/i_movies_service.dart';

class MoviesController extends GetxController with MessagesMixin {
  final IGenresService _genresService;
  final IMoviesService _moviesService;
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
  })  : _genresService = genresService,
        _moviesService = moviesService;

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

      final popularMoviesData = await _moviesService.getPopularMovies();
      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMoviesData;

      final topRatedMoviesData = await _moviesService.getTopRated();
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
}
