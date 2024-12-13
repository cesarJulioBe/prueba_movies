import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/movie.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/usecases/get_movie_recommeded_usecases.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/usecases/get_movies_usecases.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUsecases getMoviesUsecases;
  final GetMoviesRecommendedUsecases getMoviesRecommendedUsecases;
  MoviesBloc(
    this.getMoviesUsecases,
    this.getMoviesRecommendedUsecases,
  ) : super(
          MoviesInitialState(),
        ) {
    on<GetMoviesEvent>(
      _onGetMoviesEvent,
    );
  }
  void _onGetMoviesEvent(
    GetMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    emit(
      MoviesLoadingState(),
    );
    final List<Movie> moviesRecommended = [];
    final List<Movie> moviesTopRated = [];
    final result = await getMoviesUsecases.call();
    result.fold(
      (error) {
        emit(
          MoviesErrorState(),
        );
      },
      (movies) async {
        moviesTopRated.addAll(
          movies,
        );
      },
    );
    final resultRecommended = await getMoviesRecommendedUsecases.call();
    resultRecommended.fold(
      (error) {
        emit(
          MoviesErrorState(),
        );
      },
      (moviesRecommendedm) {
        moviesRecommended.addAll(moviesRecommendedm);
      },
    );
    if (moviesRecommended.isNotEmpty && moviesTopRated.isNotEmpty) {
      emit(
        MoviesSuccessState(
          moviesTopRated,
          moviesRecommended,
        ),
      );
    }
  }
}
