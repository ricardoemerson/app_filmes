import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/ui/widgets/movie_card.dart';
import 'favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        centerTitle: true,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: Get.width,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: controller.movies
                  .map(
                    (movie) => MovieCard(
                      movie: movie,
                      favoriteCallback: () => controller.removeFavorite(movie),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      }),
    );
  }
}
