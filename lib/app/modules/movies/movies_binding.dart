import 'package:get/get.dart';

import '../../data/repositories/genres/genres_repository.dart';
import '../../data/repositories/genres/i_genres_repository.dart';
import '../../data/services/genres/genres_service.dart';
import '../../data/services/genres/i_genres_service.dart';
import 'movies_controller.dart';

class MoviesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IGenresRepository>(
        () => GenresRepository(restClient: Get.find()));

    Get.lazyPut<IGenresService>(
        () => GenresService(genresRepository: Get.find()));

    Get.lazyPut<MoviesController>(
      () => MoviesController(
          genresService: Get.find(),
          moviesService: Get.find(),
          authService: Get.find()),
    );
  }
}
