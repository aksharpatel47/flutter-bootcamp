import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quizzler",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quizzler"),
        ),
        body: QuizWidget(),
      ),
    );
  }
}

class QuizWidget extends StatefulWidget {
  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  final questions = Questions();
  Question currentQuestion;

  _QuizWidgetState() {
    currentQuestion = questions.getNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestion == null) {
      return buildResultWidget();
    }
    return buildQuestionWidget();
  }

  Widget buildResultWidget() {
    final result = questions.getResult();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Result",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 48),
        ),
        Text(
          "${result[0]} / ${result[1]}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32),
        ),
        FlatButton(
          child: Icon(
            Icons.replay,
            size: 32,
          ),
          onPressed: () {
            questions.resetQuiz();
            setState(() {
              currentQuestion = questions.getNextQuestion();
            });
          },
        )
      ],
    );
  }

  Widget buildQuestionWidget() {
    return QuestionWidget(
      question: questions.getNextQuestion(),
      pressed: pressed,
    );
  }

  void pressed(bool answer) {
    questions.answerCurrentQuestion(answer);
    setState(() {
      currentQuestion = questions.getNextQuestion();
    });
  }
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  final void Function(bool) pressed;

  QuestionWidget({this.question, this.pressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            question.question,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: RaisedButton(
            color: Colors.blue.shade900,
            textColor: Colors.white,
            child: Text("Yes"),
            onPressed: () => pressed(true),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: RaisedButton(
            color: Colors.blue.shade900,
            textColor: Colors.white,
            child: Text("No"),
            onPressed: () => pressed(false),
          ),
        ),
      ],
    );
  }
}
