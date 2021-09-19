import 'package:firebase_remote_config/firebase_remote_config.dart';

import './i_genres_repository.dart';
import '../../models/genre.dart';
import '../../services/api/rest_client.dart';

class GenresRepository implements IGenresRepository {
  final RestClient _restClient;

  GenresRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<Genre>> getGenres() async {
    final response = await _restClient.get<List<Genre>>(
      '/genre/movie/list',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
      },
      decoder: (data) {
        final responseData = data['genres'];

        if (responseData != null) {
          return responseData
              .map<Genre>((genre) => Genre.fromMap(genre))
              .toList();
        }

        return <Genre>[];
      },
    );

    if (response.hasError) {
      print('response.hasError: ${response.statusText}');
      throw Exception('Erro ao buscar categorias de filmes.');
    }

    return response.body ?? <Genre>[];
  }
}
