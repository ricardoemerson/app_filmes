import 'package:get/get.dart';

import '../../data/models/movie.dart';
import '../../data/services/auth/auth_service.dart';
import '../../data/services/movies/i_movies_service.dart';

class FavoritesController extends GetxController {
  final IMoviesService _moviesService;
  final AuthService _authService;

  final movies = <Movie>[].obs;

  FavoritesController({
    required IMoviesService moviesService,
    required AuthService authService,
  })  : _moviesService = moviesService,
        _authService = authService;

  @override
  Future<void> onReady() async {
    super.onReady();

    await getFavorites();
  }

  Future<void> getFavorites() async {
    final user = _authService.user;

    if (user != null) {
      final favorites = await _moviesService.getFavoritesMovies(user.uid);

      movies.assignAll(favorites);
    }
  }

  Future<void> removeFavorite(Movie movie) async {
    final user = _authService.user;

    if (user != null) {
      await _moviesService.addOrRemoveFavorite(
        user.uid,
        movie.copyWith(favorite: false),
      );

      movies.remove(movie);
    }
  }
}
