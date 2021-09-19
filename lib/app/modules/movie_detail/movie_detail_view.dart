import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'movie_detail_controller.dart';
import 'widgets/movie_detail_content.dart';
import 'widgets/movie_detail_header.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailHeader(
                movie: controller.movie.value,
              ),
              MovieDetailContent(
                movie: controller.movie.value,
              ),
            ],
          );
        }),
      ),
    );
  }
}
