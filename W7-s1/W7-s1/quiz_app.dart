import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'model/submission.dart';
import 'screens/welcome_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentIndex = 0;
  final Submission _submission = Submission();

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      WelcomeScreen(onStartQuiz: () => _changeScreen(1)),
      QuestionScreen(
        quiz: widget.quiz,
        submission: _submission,
        onQuizCompleted: () => _changeScreen(2),
      ),
      ResultScreen(
        quiz: widget.quiz,
        submission: _submission,
        onRestartQuiz: () {
          _submission.removeAnswers();
          _changeScreen(0);
        },
      ),
    ];
  }

  void _changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: _screens[_currentIndex],
      ),
    );
  }
}
