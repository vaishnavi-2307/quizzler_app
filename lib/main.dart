import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizzbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorecount = [];
  void checkans(bool userpickedanswer) {
    bool correctanswer = quizBrain.getcorrectAnswer();
    setState(() {
      if (quizBrain.isfinished() == true) {
        Alert(
                context: context,
                title: 'finished!',
                desc: 'you\'ve reached the end of the quiz.')
            .show();
        quizBrain.reset();
        scorecount = [];
      } else {
        if (userpickedanswer == correctanswer) {
          // print('user got it right');
          scorecount.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          // print('user got wrong');
          scorecount.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }

        quizBrain.nextquestion();
      }
    });
  }
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // List<bool> answers = [false, true, true];
  // Question q1 = Question(q: 'flutter is the best technology.', a: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuetionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            // ignore: deprecated_member_use
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkans(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            // ignore: deprecated_member_use
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkans(false);
              },
            ),
          ),
        ),
        Row(
          children: scorecount,
        ),
      ],
    );
  }
}
