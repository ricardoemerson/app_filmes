import 'package:flutter/material.dart';

import '../../../data/models/movie_detail.dart';

class MovieDetailContentOverview extends StatelessWidget {
  final MovieDetail? movie;

  const MovieDetailContentOverview({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 50),
          child: Text(
            movie?.overview ?? '',
            style: const TextStyle(
              fontSize: 14,
              height: 1.3,
            ),
          )),
    );
  }
}
