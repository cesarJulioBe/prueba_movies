import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_movies/config/theme/app_theme.dart';
import 'package:prueba_tecnica_movies/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:prueba_tecnica_movies/features/movies/data/services/movies_services.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/usecases/get_movie_detail_usecases.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/usecases/get_movie_recommeded_usecases.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/usecases/get_movies_usecases.dart';
import 'package:prueba_tecnica_movies/features/movies/presentation/screens/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:prueba_tecnica_movies/features/movies/presentation/screens/movies/bloc/movies_bloc.dart';
import 'package:prueba_tecnica_movies/features/movies/presentation/screens/movies/movies_screen.dart';
import 'package:prueba_tecnica_movies/features/movies/presentation/screens/movie_detail/movie_detail_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
      ),
    );
    final moviesService = MoviesServicesImpl(dio);
    final moviesRepository = MoviesRepositoryImpl(moviesService);
    final getMoviesUsecases = GetMoviesUsecases(
      moviesRepository,
    );
    final getMoviesRecommendedUsecases = GetMoviesRecommendedUsecases(
      moviesRepository,
    );
    final getMovieDetailUsecases = GetMovieDetailUsecases(
      moviesRepository,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesBloc>(
          create: (_) => MoviesBloc(
            getMoviesUsecases,
            getMoviesRecommendedUsecases,
          )..add(
              GetMoviesEvent(),
            ),
        ),
        BlocProvider<MovieDetailBloc>(
          create: (_) => MovieDetailBloc(
            getMovieDetailUsecases,
          ),
        ),
      ],
      child: AdaptiveTheme(
        light: AppTheme.init(
          isDarkMode: false,
        ),
        dark: AppTheme.init(
          isDarkMode: true,
        ),
        initial: AdaptiveThemeMode.light,
        builder: (light, dark) => MaterialApp(
          theme: light,
          darkTheme: dark,
          title: 'Prueba Tecnica',
          initialRoute: MoviesScreen.route,
          routes: {
            MoviesScreen.route: (context) => const MoviesScreen(),
            MovieDetailScreen.route: (context) => const MovieDetailScreen(),
          },
        ),
      ),
    );
  }
}
