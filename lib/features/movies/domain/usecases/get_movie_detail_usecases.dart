import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/movie.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/repositories/movies_repositories.dart';

class GetMovieDetailUsecases {
  final MoviesRepositories repository;

  GetMovieDetailUsecases(
    this.repository,
  );
  Future<Either<Fail<dynamic>, Movie>> call(
    String movieId,
  ) {
    return repository.getMovieDetail(
      movieId,
    );
  }
}
