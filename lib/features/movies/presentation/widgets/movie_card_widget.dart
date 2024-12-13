import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:prueba_tecnica_movies/config/constans.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/movie.dart';
import 'package:prueba_tecnica_movies/features/movies/presentation/screens/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:prueba_tecnica_movies/features/movies/presentation/screens/movie_detail/movie_detail_screen.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<MovieDetailBloc>().add(
              GetMovieDetailEvent(
                movie.id,
              ),
            );
        Navigator.of(context).pushNamed(
          MovieDetailScreen.route,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                30,
              ),
              child: CachedNetworkImage(
                imageUrl: '${AppConstans.posterUrl}/${movie.poster}',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: RatingStars(
                value: double.parse(
                      movie.score,
                    ) /
                    2,
                starSize: 16,
                maxValueVisibility: false,
                valueLabelVisibility: false,
                starSpacing: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
