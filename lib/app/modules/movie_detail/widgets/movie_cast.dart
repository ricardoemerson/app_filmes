import 'package:flutter/material.dart';

import '../../../data/extensions/theme_extension.dart';
import '../../../data/models/cast.dart';

class MovieCast extends StatelessWidget {
  final Cast? cast;

  const MovieCast({
    Key? key,
    required this.cast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              cast?.image ?? '',
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            cast?.name ?? '',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            cast?.character ?? '',
            style: TextStyle(
              fontSize: 12,
              color: context.themeGrey,
            ),
          ),
        ],
      ),
    );
  }
}
