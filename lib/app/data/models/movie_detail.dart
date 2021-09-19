import 'dart:convert';

import 'cast.dart';
import 'genre.dart';

class MovieDetail {
  final String title;
  final double stars;
  final List<Genre> genres;
  final List<String> urlImages;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<Cast> cast;

  MovieDetail({
    required this.title,
    required this.stars,
    required this.genres,
    required this.urlImages,
    required this.releaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'vote_average': stars,
      'genres': genres.map((x) => x.toMap()).toList(),
      'urlImages': urlImages,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'overview': overview,
      'productionCompanies': productionCompanies,
      'originalLanguage': originalLanguage,
      'cast': cast.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieDetail.fromMap(Map<String, dynamic> map) {
    final urlImagesPosters = map['images']['posters'];
    final urlImages = urlImagesPosters
            ?.map<String>(
                (i) => 'https://image.tmdb.org/t/p/w200${i['file_path']}')
            .toList() ??
        const [];

    return MovieDetail(
      title: map['title'] ?? '',
      stars: map['vote_average'] ?? 0.0,
      genres: List<Genre>.from(
          map['genres'].map((x) => Genre.fromMap(x)) ?? const []),
      urlImages: urlImages,
      releaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'] ?? '',
      productionCompanies:
          List<dynamic>.from(map['production_companies'] ?? const [])
              .map<String>((p) => p['name'])
              .toList(),
      originalLanguage: map['original_language'] ?? '',
      cast: List<Cast>.from(
          map['credits']['cast'].map((x) => Cast.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetail.fromJson(String source) =>
      MovieDetail.fromMap(json.decode(source));
}
