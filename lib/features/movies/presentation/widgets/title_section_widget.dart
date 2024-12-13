import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  const TitleSectionWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "See all",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
