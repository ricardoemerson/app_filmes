import 'package:get/get.dart';

import '../../core/ui/messages/messages_mixin.dart';
import '../../data/models/genre.dart';
import '../../data/models/message.dart';
import '../../data/services/genres/i_genres_service.dart';

class MoviesController extends GetxController with MessagesMixin {
  final IGenresService _genresService;
  final _message = Rxn<Message>();

  final genres = <Genre>[].obs;

  MoviesController({
    required IGenresService genresService,
  }) : _genresService = genresService;

  @override
  void onInit() {
    super.onInit();

    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      final data = await _genresService.getGenres();
      genres.assignAll(data);
    } catch (err) {
      print('err: $err');
      _message(
        Message.error(
          title: 'Erro',
          message: 'Erro ao buscar categorias de filmes.',
        ),
      );
    }
  }
}
