import 'package:flutter/material.dart';
import '../model/quiz.dart';
import '../model/submission.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  final VoidCallback onQuizCompleted;
  final Submission submission;

  const QuestionScreen({
    required this.quiz,
    required this.submission,
    required this.onQuizCompleted,
    super.key,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _currentQuestionIndex = 0;

  void _answerQuestion(String answer) {
    final currentQuestion = widget.quiz.questions[_currentQuestionIndex];
    widget.submission.addAnswer(currentQuestion, answer);

    setState(() {
      if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        widget.onQuizCompleted();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.quiz.questions[_currentQuestionIndex];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the current question title
          Text(
            currentQuestion.title,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          // Render buttons with padding
          for (var answer in currentQuestion.possibleAnswers)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Add space between buttons
              child: ElevatedButton(
                onPressed: () => _answerQuestion(answer),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  answer,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
