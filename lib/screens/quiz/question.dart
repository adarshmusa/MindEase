import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: const TextStyle(color: Colors.black, fontSize: 25, fontFamily: 'FontMainSemibold'),
        textAlign: TextAlign.center,
      ), //Text
    ); //Container
  }
}
