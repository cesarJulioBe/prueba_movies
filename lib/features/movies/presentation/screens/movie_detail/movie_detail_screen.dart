import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:prueba_tecnica_movies/config/constans.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/actor.dart';
import 'package:prueba_tecnica_movies/features/movies/presentation/screens/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:prueba_tecnica_movies/features/movies/presentation/widgets/actor_widget.dart';
import 'package:prueba_tecnica_movies/features/movies/presentation/widgets/description_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  static const String route = '/movie_description';

  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        if (state is MovieDetailLoadingState ||
            state is MovieDetailInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieDetailErrorState) {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        } else {
          state as MovieDetailSuccessState;
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              '${AppConstans.posterUrl}/${state.movie.poster}',
                          height: MediaQuery.of(context).size.height / 3,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            state.movie.title,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'WHATCH NOW',
                              ),
                            ),
                            RatingStars(
                              maxValueVisibility: false,
                              valueLabelVisibility: false,
                              value: double.parse(
                                    state.movie.score,
                                  ) /
                                  2,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          state.movie.description,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (Actor actor in state.movie.actors)
                                    ActorWidget(
                                      actor: actor,
                                    ),
                                ],
                              ),
                            ),
                            DescriptionWidget(
                              title: 'Studio',
                              description: state.movie.companies
                                  .map(
                                    (c) => c.name,
                                  )
                                  .toString(),
                            ),
                            DescriptionWidget(
                              title: 'Genre',
                              description: state.movie.genders
                                  .map(
                                    (c) => c.name,
                                  )
                                  .toString(),
                            ),
                            DescriptionWidget(
                              title: 'Release',
                              description: state.movie.release,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
