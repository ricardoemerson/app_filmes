import './i_movies_service.dart';
import '../../models/movie.dart';
import '../../models/movie_detail.dart';
import '../../repositories/movies/i_movies_repository.dart';

class MoviesService implements IMoviesService {
  final IMoviesRepository _moviesRepository;

  MoviesService({
    required IMoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  @override
  Future<List<Movie>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<Movie>> getTopRated() => _moviesRepository.getTopRated();

  @override
  Future<MovieDetail?> getDetail(int id) => _moviesRepository.getDetail(id);

  @override
  Future<void> addOrRemoveFavorite(String userId, Movie movie) =>
      _moviesRepository.addOrRemoveFavorite(userId, movie);

  @override
  Future<List<Movie>> getFavoritesMovies(String userId) =>
      _moviesRepository.getFavoritesMovies(userId);
}
