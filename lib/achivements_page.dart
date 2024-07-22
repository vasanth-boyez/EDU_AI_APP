import 'package:flutter/material.dart';

class UserAchievementsPage extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;
  final double percentage;

  const UserAchievementsPage({
    Key? key,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Achievements Page',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'You answered $correctAnswers out of $totalQuestions questions correctly.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            'Your performance: ${percentage.toStringAsFixed(2)}%',
            style: TextStyle(fontSize: 18),
          ),
          // Add any additional widgets or UI elements here
        ],
      ),
    );
  }
}
