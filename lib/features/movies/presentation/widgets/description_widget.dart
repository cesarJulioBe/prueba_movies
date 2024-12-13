import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            description,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
