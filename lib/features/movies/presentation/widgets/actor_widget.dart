import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_movies/config/constans.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/actor.dart';

class ActorWidget extends StatelessWidget {
  const ActorWidget({
    super.key,
    required this.actor,
  });

  final Actor actor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.red,
            backgroundImage: CachedNetworkImageProvider(
              '${AppConstans.posterUrl}/${actor.image}',
            ),
          ),
          Center(
            child: Text(
              actor.name,
              style: const TextStyle(
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
