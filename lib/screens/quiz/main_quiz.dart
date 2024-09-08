import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//void main() => runApp(const Quiz());

// class Quiz extends StatefulWidget {
//   const Quiz({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return _QuizState();
//   }
// }

class MainQuiz extends StatefulWidget {
  const MainQuiz({Key? key}) : super(key: key);

  @override
  State<MainQuiz> createState() => _MainQuizState();
}

class _MainQuizState extends State<MainQuiz> {
  final _questions = const [
    {
      'questionText': 'Over the past two weeks, how often have you experienced feelings of sadness or hopelessness?',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'A few days', 'score': 1},
        {'text': 'Several days', 'score': 2},
        {'text': 'Most days', 'score': 3},
      ],
    },
    {
      'questionText': 'Are you finding it difficult to enjoy activities that you once found pleasurable?',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Sometimes', 'score': 1},
        {'text': 'Often', 'score': 2},
        {
          'text':
          'Always',
          'score': 3
        },
      ],
    },
    {
      'questionText': 'Are you facing difficulties falling asleep or staying asleep?',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Occasionally', 'score': 1},
        {'text': 'Frequently', 'score': 2},
        {'text': 'Most nights', 'score': 3},
      ],
    },
    {
      'questionText': 'Have you experienced changes in your appetite or weight recently?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes, I have been eating more than usual', 'score': 1},
        {'text': 'Yes, I have been eating less than usual', 'score': 2},
      ],
    },
    {
      'questionText':
      'Have you noticed a decline in your performance at work, school, or daily tasks?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes, but it is manageable', 'score': 1},
        {'text': 'Yes, and it is affecting my productivity', 'score': 1},
      ],
    },
    {
      'questionText':
      'Do you feel isolated or withdrawn from friends and family?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Occasionally', 'score': 1},
        {'text': 'Often', 'score': 2},
        {'text': 'Almost always', 'score': 3},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    // ignore: avoid_print
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      // ignore: avoid_print
      print('We have more questions!');
    } else {
      // ignore: avoid_print
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Mental Health Assessment',
            style: TextStyle(
              fontFamily: 'FontMainHeavy',
            ),),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
