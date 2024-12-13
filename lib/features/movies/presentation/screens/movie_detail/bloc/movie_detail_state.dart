part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class MovieDetailInitialState extends MovieDetailState {}

final class MovieDetailLoadingState extends MovieDetailState {}

final class MovieDetailErrorState extends MovieDetailState {}

final class MovieDetailSuccessState extends MovieDetailState {
  final Movie movie;
  MovieDetailSuccessState(
    this.movie,
  );
}
