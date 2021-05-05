import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_family/screens/questions_screen/question4.dart';
import 'package:quiz_family/screens/questions_screen/questions_widgets/question_button.dart';

// ignore: must_be_immutable
class Question3 extends StatefulWidget {
  String name;
  int correctAnswer = 1;
  int selectedAnswer;

  Question3({this.name});

  @override
  _Question3State createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade700,
      body: Container(
        margin: EdgeInsets.fromLTRB(25, 50, 20, 25),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "${widget.name}, em Julho de 2018 a gente viu a Final da Copa America, em qual estadio ? ",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(
              height: 100,
            ),

            Icon(
              FontAwesomeIcons.futbol,
              size: 60,
            ),

            SizedBox(
              height: 100,
            ),
            //  Opçōes
            QuestionButton(
                text: "Vila Belmiro",
                color: colorButtom(0),
                action: () {
                  winOrLose(false);
                  setState(() {
                    widget.selectedAnswer = 0;
                  });
                  nextScreen();
                }),
            QuestionButton(
                text: "Maracanã",
                color: colorButtom(1),
                action: () {
                  winOrLose(true);
                  setState(() {
                    widget.selectedAnswer = 1;
                  });
                  nextScreen();
                }),
            QuestionButton(
                text: "Morumbi",
                color: colorButtom(2),
                action: () {
                  winOrLose(false);
                  setState(() {
                    widget.selectedAnswer = 2;
                  });

                  nextScreen();
                }),
            QuestionButton(
                text: "Mineirão",
                color: colorButtom(3),
                action: () {
                  winOrLose(false);
                  setState(() {
                    widget.selectedAnswer = 3;
                  });
                  nextScreen();
                }),
          ],
        ),
      ),
    );
  }

  Future<void> nextScreen() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Question4(name: widget.name,)));
  }

  Color colorButtom(int number) {
    if (widget.selectedAnswer != null) {
      if (widget.selectedAnswer == widget.correctAnswer &&
          widget.correctAnswer == number) {
        return Colors.green;
      } else if (widget.selectedAnswer != widget.correctAnswer &&
          widget.selectedAnswer == number) {
        return Colors.red;
      } else if (number == widget.correctAnswer) {
        return Colors.green;
      } else {
        return Colors.white;
      }
    } else {
      return Colors.white;
    }
  }

  winOrLose(bool correct) {
      Fluttertoast.showToast(
        msg: correct? "ACERTOU!!": "ERROU!!",
        backgroundColor: correct? Colors.green : Colors.red,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 18.0,
      );
  }
  
}