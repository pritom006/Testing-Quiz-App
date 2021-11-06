import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favourite food?',
      'answers': [
        {'text': 'biriyani', 'score': 10},
        {'text': 'rice', 'score': 20},
        {'text': 'mutton', 'score': 30},
        {'text': 'chicken', 'score': 40},
      ],
    },
    {
      'questionText': 'What is your favourite color?',
      'answers': [
        {'text': 'yellow', 'score': 10},
        {'text': 'red', 'score': 20},
        {'text': 'blue', 'score': 30},
        {'text': 'green', 'score': 40},
      ],
    },
    {
      'questionText': 'What is your favourite game?',
      'answers': [
        {'text': 'cricket', 'score': 10},
        {'text': 'football', 'score': 20},
        {'text': 'volly', 'score': 30},
        {'text': 'hockey', 'score': 40},
      ],
    },
    {
      'questionText': 'What is your favourite personality?',
      'answers': [
        {'text': 'stives jobs', 'score': 10},
        {'text': 'elon musk', 'score': 20},
        {'text': 'ganguly', 'score': 30},
        {'text': 'bangabandhu', 'score': 40},
      ],
    },
  ];

  var _answerIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _answerIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _answerIndex = _answerIndex + 1;
    });
    print(_answerIndex);

    if (_answerIndex < _questions.length) {
      print("You have more questions..");
    } else {
      print("You have done!! Congratulations");
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("My Quiz App"),
        ),
        body: _answerIndex < _questions.length
            ? Quiz(
                answerQuestions: _answerQuestions,
                questions: _questions,
                answerIndex: _answerIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
