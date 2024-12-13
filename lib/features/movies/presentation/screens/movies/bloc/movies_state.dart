part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class MoviesInitialState extends MoviesState {}

final class MoviesLoadingState extends MoviesState {}

final class MoviesErrorState extends MoviesState {}

final class MoviesSuccessState extends MoviesState {
  final List<Movie> movies;
  final List<Movie> moviesRecommended;
  MoviesSuccessState(
    this.movies,
    this.moviesRecommended,
  );
}
