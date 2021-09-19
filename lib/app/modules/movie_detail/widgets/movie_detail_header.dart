import 'package:flutter/material.dart';

import '../../../data/models/movie_detail.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetail? movie;

  const MovieDetailHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieData = movie;

    if (movieData != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: movieData.urlImages.length,
          itemBuilder: (context, index) {
            final image = movieData.urlImages[index];

            return Padding(
              padding: const EdgeInsets.all(2),
              child: Image.network(image),
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
