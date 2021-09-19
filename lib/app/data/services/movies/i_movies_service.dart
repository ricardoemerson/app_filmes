import '../../models/movie.dart';
import '../../models/movie_detail.dart';

abstract class IMoviesService {
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRated();
  Future<MovieDetail?> getDetail(int id);
  Future<void> addOrRemoveFavorite(String userId, Movie movie);
  Future<List<Movie>> getFavoritesMovies(String userId);
}
