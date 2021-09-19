import 'package:get/get.dart';

import '../../core/ui/loader/loader_mixin.dart';
import '../../core/ui/messages/messages_mixin.dart';
import '../../data/models/message.dart';
import '../../data/models/movie_detail.dart';
import '../../data/services/movies/i_movies_service.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  var loading = false.obs;
  var message = Rxn<Message>();
  var movie = Rxn<MovieDetail>();

  final IMoviesService _moviesService;

  MovieDetailController({
    required IMoviesService moviesService,
  }) : _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();

    loaderListener(loading);
    messageListener(message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      final movieId = Get.arguments;

      loading(true);

      final movieDetailData = await _moviesService.getDetail(movieId);
      movie.value = movieDetailData;

      loading(false);
    } catch (err) {
      print('err: $err');
      loading(false);
      message(Message.error(
          title: 'Erro', message: 'Erro ao buscar detalhe do filme.'));
    }
  }
}
