import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/movie.dart';
import 'package:prueba_tecnica_movies/features/movies/presentation/screens/movies/bloc/movies_bloc.dart';
import 'package:prueba_tecnica_movies/features/movies/presentation/widgets/movie_card_widget.dart';
import 'package:prueba_tecnica_movies/features/movies/presentation/widgets/title_section_widget.dart';

class MoviesScreen extends StatelessWidget {
  static const String route = '/';

  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
              bottom: 30,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        AdaptiveTheme.of(context).toggleThemeMode();
                      },
                      child: const Icon(
                        Icons.bedtime_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Hello, what do you\nwant to watch ?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    hintText: "Search",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadiusDirectional.vertical(
                  top: Radius.circular(
                    30,
                  ),
                ),
              ),
              child: BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) {
                  if (state is MoviesLoadingState ||
                      state is MoviesInitialState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is MoviesErrorState) {
                    return const Center(
                      child: Text('Error'),
                    );
                  } else {
                    state as MoviesSuccessState;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          const TitleSectionWidget(
                            title: 'RECOMMENDED FOR YOU',
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (Movie movie in state.moviesRecommended)
                                  MovieCardWidget(
                                    movie: movie,
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const TitleSectionWidget(
                            title: 'TOP RATED',
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (Movie movie in state.movies)
                                  MovieCardWidget(
                                    movie: movie,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
