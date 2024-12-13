import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_movies/features/movies/data/services/movies_services.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/movie.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/repositories/movies_repositories.dart';

class MoviesRepositoryImpl implements MoviesRepositories {
  final MoviesServices moviesServices;

  MoviesRepositoryImpl(
    this.moviesServices,
  );

  @override
  Future<Either<Fail, List<Movie>>> getMovies() async {
    try {
      await moviesServices.autentication();
      final result = await moviesServices.getTopRatedMovies();
      return Right(
        result,
      );
    } catch (e) {
      return Left(
        Fail(
          e,
        ),
      );
    }
  }

  @override
  Future<Either<Fail, Movie>> getMovieDetail(
    String movieId,
  ) async {
    try {
      Movie movie = await moviesServices.getMovieDetail(
        movieId,
      );
      final actors = await moviesServices.getActorsMovie(
        movieId,
      );
      movie = movie.copyWith(
        actors: actors,
      );
      return Right(
        movie,
      );
    } catch (e) {
      return Left(
        Fail(
          e,
        ),
      );
    }
  }

  @override
  Future<Either<Fail, List<Movie>>> getMoviesRecommended() async {
    try {
      final result = await moviesServices.getRecommededMovies();
      return Right(
        result,
      );
    } catch (e) {
      return Left(
        Fail(
          e,
        ),
      );
    }
  }
}
