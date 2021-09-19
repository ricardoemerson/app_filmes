import '../../models/genre.dart';

abstract class IGenresService {
  Future<List<Genre>> getGenres();
}
