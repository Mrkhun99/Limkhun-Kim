import 'package:flutter/material.dart';
import 'quiz_app.dart';
import 'model/quiz.dart';

void main() {
  Question q1 = const Question(
      title: "Who is the best teacher?",
      possibleAnswers: ["Ronan", "Hongly", 'Leangsiv'],
      goodAnswer: 'Ronan');
  Question q2 = const Question(
      title: "Which color is the best?",
      possibleAnswers: ["Blue", "Red", 'Green'],
      goodAnswer: 'Green');

  List<Question> myQuestions = [q1, q2];
  Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);

  runApp(QuizApp(myQuiz));
}
