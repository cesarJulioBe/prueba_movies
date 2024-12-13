import 'package:prueba_tecnica_movies/features/movies/domain/models/actor.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/company.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/gender.dart';

class Movie {
  final String id;
  final String poster;
  final String title;
  final String score;
  final String description;
  final List<Gender> genders;
  final List<Company> companies;
  final String release;
  final List<Actor> actors;
  final Map<String, dynamic> extra;

  Movie({
    required this.id,
    required this.poster,
    required this.title,
    required this.score,
    required this.description,
    required this.genders,
    required this.companies,
    required this.release,
    required this.actors,
    required this.extra,
  });

  Movie copyWith({
    String? id,
    String? poster,
    String? title,
    String? score,
    String? description,
    List<Gender>? genders,
    List<Company>? companies,
    String? release,
    List<Actor>? actors,
    Map<String, dynamic>? extra,
  }) {
    return Movie(
      id: id ?? this.id,
      poster: poster ?? this.poster,
      title: title ?? this.title,
      score: score ?? this.score,
      description: description ?? this.description,
      genders: genders ?? this.genders,
      companies: companies ?? this.companies,
      release: release ?? this.release,
      actors: actors ?? this.actors,
      extra: extra ?? this.extra,
    );
  }

  factory Movie.fromJson(
    Map<String, dynamic> json,
  ) {
    return Movie(
      id: json['id'].toString(),
      poster: json['poster_path'],
      title: json['title'],
      score: json['vote_average'].toString(),
      description: json['overview'],
      genders: [],
      companies: [],
      release: json['release_date'],
      actors: [],
      extra: json,
    );
  }
}
