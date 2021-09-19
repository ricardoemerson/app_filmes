import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/ui/widgets/movie_card.dart';
import '../../../data/models/movie.dart';
import '../movies_controller.dart';

class MoviesGroup extends GetView<MoviesController> {
  final String title;
  final List<Movie> movies;

  const MoviesGroup({
    Key? key,
    required this.title,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 270,
            child: Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return MovieCard(
                    movie: movie,
                    favoriteCallback: () => controller.favoriteMovie(movie),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
