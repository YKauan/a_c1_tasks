import 'package:flutter/material.dart';

class DifficultyWidget extends StatelessWidget {
  const DifficultyWidget({super.key, required this.difficultyLevel});

  final int difficultyLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: (difficultyLevel >= 1)
              ? Colors.deepPurpleAccent
              : Colors.deepPurpleAccent[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (difficultyLevel >= 2)
              ? Colors.deepPurpleAccent
              : Colors.deepPurpleAccent[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (difficultyLevel >= 3)
              ? Colors.deepPurpleAccent
              : Colors.deepPurpleAccent[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (difficultyLevel >= 4)
              ? Colors.deepPurpleAccent
              : Colors.deepPurpleAccent[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (difficultyLevel >= 5)
              ? Colors.deepPurpleAccent
              : Colors.deepPurpleAccent[100],
        ),
      ],
    );
  }
}
