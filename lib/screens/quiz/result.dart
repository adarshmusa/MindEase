// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:companion_app/screens/home/home.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

//Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore >= 7) {
      resultText = 'Seems like you are in need of help.\nFeel free to book a consultation with certified therapists!';
      print(resultScore);
    } else if (resultScore >= 4) {
      resultText = 'You are doing just okay.';
    } else {
      resultText = 'You are doing good!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage('https://www.iconshock.com/3D/general/png/thumbnails/love-passion-affection-fondness-attachment.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, fontFamily: 'FontMainSemibold'),
            textAlign: TextAlign.center,
          ),
          /*//Text
          Text(
            'Score ' '$resultScore',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
           //Text
           */
          SizedBox(height: 20),
          TextButton(
            //onPressed: () => resetHandler(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()), // Navigate to Home
              );
            },
            child: Container(
              color: Colors.deepPurpleAccent,
              padding: const EdgeInsets.all(14),
              child: const Text(
                'Back To Home',
                style: TextStyle(color: Colors.white, fontFamily: 'FontMainSemibold'),
              ),
            ),
          ),
          // FlatButton is deprecated and should not be used
          // Use TextButton instead

          // FlatButton(
          // child: Text(
          //	 'Restart Quiz!',
          // ), //Text
          // textColor: Colors.blue,
          // onPressed: resetHandler(),
          // ), //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
