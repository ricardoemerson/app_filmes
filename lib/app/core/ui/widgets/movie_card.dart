import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../data/extensions/theme_extension.dart';
import '../../../data/models/movie.dart';
import '../../config/app_filmes_icons_icons.dart';

class MovieCard extends StatelessWidget {
  final dateFormat = DateFormat('y');
  final Movie movie;
  final VoidCallback favoriteCallback;

  MovieCard({
    Key? key,
    required this.movie,
    required this.favoriteCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed('/movie-detail', arguments: movie.id),
      child: SizedBox(
        width: 158,
        height: 280,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage.memoryNetwork(
                        width: 148,
                        height: 184,
                        placeholder: kTransparentImage,
                        image:
                            'https://image.tmdb.org/t/p/w200/${movie.posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    movie.title,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    dateFormat.format(DateTime.parse(movie.releaseDate)),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 63,
              right: -7,
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 30,
                  child: IconButton(
                    iconSize: 13,
                    onPressed: favoriteCallback,
                    icon: Icon(
                      movie.favorite
                          ? AppFilmesIcons.heart
                          : AppFilmesIcons.heart_empty,
                      color:
                          movie.favorite ? context.themeRed : context.themeGrey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
