import './i_movies_service.dart';
import '../../models/movie.dart';
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
}
