import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/movie.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/usecases/get_movie_detail_usecases.dart';
part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUsecases getMovieDetailUsecases;
  MovieDetailBloc(
    this.getMovieDetailUsecases,
  ) : super(
          MovieDetailInitialState(),
        ) {
    on<GetMovieDetailEvent>(
      _onGetMovieDetailEvent,
    );
  }
  void _onGetMovieDetailEvent(
    GetMovieDetailEvent event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(
      MovieDetailLoadingState(),
    );
    final result = await getMovieDetailUsecases.call(
      event.movieId,
    );
    result.fold(
      (error) {
        emit(
          MovieDetailErrorState(),
        );
      },
      (movie) {
        emit(
          MovieDetailSuccessState(
            movie,
          ),
        );
      },
    );
  }
}
