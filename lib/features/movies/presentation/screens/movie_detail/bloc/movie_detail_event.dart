part of 'movie_detail_bloc.dart';

class MovieDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class GetMovieDetailEvent extends MovieDetailEvent {
  final String movieId;
  GetMovieDetailEvent(
    this.movieId,
  );
}
