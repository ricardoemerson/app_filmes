import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'movies_controller.dart';
import 'widgets/movies_filter.dart';
import 'widgets/movies_group.dart';
import 'widgets/movies_header.dart';

class MoviesView extends GetView<MoviesController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children: const [
          MoviesHeader(),
          MoviesFilter(),
          MoviesGroup(
            title: 'Mais populares',
          ),
          MoviesGroup(
            title: 'Top Filmes',
          ),
        ],
      ),
    );
  }
}
