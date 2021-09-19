import 'dart:convert';

class Cast {
  final String name;
  final String image;
  final String character;

  Cast({
    required this.name,
    required this.image,
    required this.character,
  });

  Map<String, dynamic> toMap() {
    return {
      'original_name': name,
      'profile_path': image,
      'character': character,
    };
  }

  factory Cast.fromMap(Map<String, dynamic> map) {
    return Cast(
      name: map['original_name'] ?? '',
      image: 'https://image.tmdb.org/t/p/w200${map['profile_path']}',
      character: map['character'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Cast.fromJson(String source) => Cast.fromMap(json.decode(source));
}
