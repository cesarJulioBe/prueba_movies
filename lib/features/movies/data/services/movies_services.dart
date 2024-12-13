import 'package:dio/dio.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/actor.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/company.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/gender.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/movie.dart';

abstract class MoviesServices {
  Future<void> autentication();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> getRecommededMovies();
  Future<Movie> getMovieDetail(
    String movieId,
  );
  Future<List<Actor>> getActorsMovie(
    String movieId,
  );
}

class MoviesServicesImpl implements MoviesServices {
  final Dio dio;
  final String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4M2M3NTM4ZWY1OTAxZWY1YWVjNWIxM2RlNGFjYTgxZCIsIm5iZiI6MTczMzkyNTE0OS42MzIsInN1YiI6IjY3NTk5OTFkNmM1MzU4ODZlZTJmNWNiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xLRpBtulmW-1bDMxdykiXR-a2Xfs2yNZ5OeZhRdKEzI';

  MoviesServicesImpl(
    this.dio,
  );

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    final List<Movie> movies = [];
    dio.options.headers['Authorization'] = 'Bearer $token';
    final result = await dio.get('/movie/top_rated');
    final datas = result.data['results'];
    for (var data in datas) {
      final movie = Movie.fromJson(
        data,
      );
      movies.add(
        movie,
      );
    }
    return movies;
  }

  @override
  Future<void> autentication() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    await dio.get('/authentication');
  }

  @override
  Future<Movie> getMovieDetail(
    String movieId,
  ) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final result = await dio.get('/movie/$movieId');
    Movie movie = Movie.fromJson(
      result.data,
    );
    final List<Gender> genders = (result.data['genres'] as List<dynamic>)
        .map(
          (dynamic data) => Gender.fromJson(
            data as Map<String, dynamic>,
          ),
        )
        .toList();
    final List<Company> companies =
        (result.data['production_companies'] as List<dynamic>)
            .map(
              (data) => Company.fromJson(
                data as Map<String, dynamic>,
              ),
            )
            .toList();
    movie = movie.copyWith(
      genders: genders,
      companies: companies,
    );
    return movie;
  }

  @override
  Future<List<Actor>> getActorsMovie(
    String movieId,
  ) async {
    final List<Actor> actors = [];
    dio.options.headers['Authorization'] = 'Bearer $token';
    final result = await dio.get('/movie/$movieId/credits');
    final datas = result.data['cast'];
    for (var data in datas) {
      if (data['known_for_department'] == 'Acting') {
        final actor = Actor.fromJson(
          data,
        );
        actors.add(
          actor,
        );
      }
    }
    return actors;
  }

  @override
  Future<List<Movie>> getRecommededMovies() async {
    final List<Movie> movies = [];
    dio.options.headers['Authorization'] = 'Bearer $token';
    final result = await dio.get('/movie/popular');
    final datas = result.data['results'];
    for (var data in datas) {
      final movie = Movie.fromJson(
        data,
      );
      movies.add(
        movie,
      );
    }
    return movies;
  }
}
