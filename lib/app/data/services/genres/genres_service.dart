import './i_genres_service.dart';
import '../../models/genre.dart';
import '../../repositories/genres/i_genres_repository.dart';

class GenresService implements IGenresService {
  final IGenresRepository _genresRepository;

  GenresService({
    required IGenresRepository genresRepository,
  }) : _genresRepository = genresRepository;

  @override
  Future<List<Genre>> getGenres() => _genresRepository.getGenres();
}
