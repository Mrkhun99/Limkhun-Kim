import 'quiz.dart';

class Answer {
  final String questionAnswer;

  Answer({required this.questionAnswer});

  bool isCorrect(String goodAnswer) {
    return questionAnswer == goodAnswer;
  }
}

class Submission {
  final Map<Question, Answer> _answers = {};

  void addAnswer(Question question, String answer) {
    _answers[question] = Answer(questionAnswer: answer);
  }

  void removeAnswers() {
    _answers.clear();
  }

  Answer? getAnswerFor(Question question) {
    return _answers[question];
  }

  int getScore() {
    int score = 0;
    for (var entry in _answers.entries) {
      if (entry.value.isCorrect(entry.key.goodAnswer)) {
        score++;
      }
    }
    return score;
  }
}
