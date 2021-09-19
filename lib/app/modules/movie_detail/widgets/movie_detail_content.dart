import 'package:flutter/material.dart';

import '../../../data/models/movie_detail.dart';
import 'movie_detail_content_main_cast.dart';
import 'movie_detail_content_overview.dart';
import 'movie_detail_content_production_companies.dart';
import 'movie_detail_content_title.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieDetail? movie;

  const MovieDetailContent({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailContentTitle(movie: movie),
        MovieDetailContentOverview(movie: movie),
        MovieDetailContentProductionCompanies(movie: movie),
        MovieDetailContentMainCast(movie: movie),
      ],
    );
  }
}
