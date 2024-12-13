import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/movie.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/repositories/movies_repositories.dart';

class GetMoviesUsecases {
  final MoviesRepositories repository;

  GetMoviesUsecases(
    this.repository,
  );
  Future<Either<Fail<dynamic>, List<Movie>>> call() {
    return repository.getMovies();
  }
}
