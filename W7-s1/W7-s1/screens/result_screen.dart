import 'package:flutter/material.dart';
import '../model/quiz.dart';
import '../model/submission.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final Submission submission;
  final VoidCallback onRestartQuiz;

  const ResultScreen({
    required this.quiz,
    required this.submission,
    required this.onRestartQuiz,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int score = submission.getScore();
    int totalQuestions = quiz.questions.length;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You scored $score out of $totalQuestions!",
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRestartQuiz,
            child: const Text("Restart Quiz"),
          ),
        ],
      ),
    );
  }
}
