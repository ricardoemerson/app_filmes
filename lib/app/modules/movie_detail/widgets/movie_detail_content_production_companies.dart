import 'package:flutter/material.dart';

import '../../../data/models/movie_detail.dart';

class MovieDetailContentProductionCompanies extends StatelessWidget {
  final MovieDetail? movie;

  const MovieDetailContentProductionCompanies({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 5),
      child: RichText(
        text: TextSpan(
            text: 'Companhia(s) produtora(s): ',
            style: const TextStyle(
              color: Color(0xFF222222),
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: movie?.productionCompanies.join(', ') ?? '',
                style: const TextStyle(
                  color: Color(0xFF222222),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ]),
      ),
    );
  }
}
