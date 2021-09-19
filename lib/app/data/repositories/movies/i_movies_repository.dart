import '../../models/movie.dart';
import '../../models/movie_detail.dart';

abstract class IMoviesRepository {
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRated();
  Future<MovieDetail?> getDetail(int id);
}
