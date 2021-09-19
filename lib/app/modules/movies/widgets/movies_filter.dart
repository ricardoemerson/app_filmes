import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../movies_controller.dart';
import 'filter_tag.dart';

class MoviesFilter extends GetView<MoviesController> {
  const MoviesFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Obx(() {
          return Row(
            children: controller.genres
                .map(
                  (genre) => FilterTag(
                    genre: genre,
                    selected: controller.selectedGenre.value?.id == genre.id,
                    onPressed: () => controller.filterMoviesByGenre(genre),
                  ),
                )
                .toList(),
          );
        }),
      ),
    );
  }
}
