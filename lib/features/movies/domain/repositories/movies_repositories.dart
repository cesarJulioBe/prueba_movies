import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/movie.dart';

abstract class MoviesRepositories {
  Future<Either<Fail, List<Movie>>> getMovies();
  Future<Either<Fail, List<Movie>>> getMoviesRecommended();
  Future<Either<Fail, Movie>> getMovieDetail(
    String movieId,
  );
}
