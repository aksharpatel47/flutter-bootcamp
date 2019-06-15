class Question {
  String question;
  bool _answer;
  bool _userAnswer;

  Question(this.question, this._answer);

  void setUserAnswer(bool userAnswer) {
    this._userAnswer = userAnswer;
  }

  bool get userAnswer => _userAnswer;

  bool get isCorrect => _userAnswer == _answer;
}

class Questions {
  List<Question> questions = [];
  int _currentIndex = 0;

  Questions() {
    questions.addAll([
      Question('Some cats are actually allergic to humans', true),
      Question('You can lead a cow down stairs but not up stairs.', false),
      Question(
          'Approximately one quarter of human bones are in the feet.', true),
      Question('A slug\'s blood is green.', true),
      Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
      Question('It is illegal to pee in the Ocean in Portugal.', true),
      Question(
          'No piece of square dry paper can be folded in half more than 7 times.',
          false),
      Question(
          'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
          true),
      Question(
          'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
          false),
      Question(
          'The total surface area of two human lungs is approximately 70 square metres.',
          true),
      Question('Google was originally called \"Backrub\".', true),
      Question(
          'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
          true),
      Question(
          'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
          true),
    ]);
  }

  Question getNextQuestion() {
    if (_currentIndex < questions.length - 1) {
      return questions.elementAt(_currentIndex);
    }

    return null;
  }

  void answerCurrentQuestion(bool answer) {
    questions.elementAt(_currentIndex).setUserAnswer(answer);
    _currentIndex += 1;
  }

  List<int> getResult() {
    int totalQuestions = 0;
    int correctQuestions = 0;
    for (final question in questions) {
      if (question.userAnswer != null) {
        totalQuestions += 1;
        if (question.isCorrect) {
          correctQuestions += 1;
        }
      }
    }

    return [correctQuestions, totalQuestions];
  }

  void resetQuiz() {
    for (final question in questions) {
      question.setUserAnswer(null);
    }

    _currentIndex = 0;
  }
}
