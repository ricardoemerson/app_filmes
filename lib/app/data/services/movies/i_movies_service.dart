import '../../models/movie.dart';

abstract class IMoviesService {
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRated();
}
