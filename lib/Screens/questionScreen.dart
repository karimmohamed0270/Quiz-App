import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/Home_screen.dart';
import 'package:quiz_app/Screens/resultScreen.dart';
import 'package:quiz_app/Screens/widgets/elevated_button.dart';
import 'package:quiz_app/dataformodel/questionsdata.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // myquestions the list in datafolder that have my data

  var currentquestionIndex = 0;
  //  to save the answer choosen by user
  List<String> choosenAnswer = [];
  void selectedAnswer(String answer) {
    choosenAnswer.add(answer);

    // to go to the result page when the questions is end
    if (choosenAnswer.length == myquestions.length) {
      // end the answer and run from the start

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Resultscreen(selectedanswers: choosenAnswer);
      }));
      // choosenAnswer = [];
    }
  }
  // end

  // set state;;
  void questionupdate(String useranswer) {
    setState(() {
      // update question
      currentquestionIndex += 1;
      // save data in list
      selectedAnswer(useranswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    // questions with answerss
    final currentQuestion = myquestions[currentquestionIndex];
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.red,
        Color.fromARGB(186, 153, 76, 175),
      ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.question,
            style: GoogleFonts.abel(color: Colors.white, fontSize: 30),
          ),
          SizedBox(
            height: 30,
          ),
//  mapoping for elevated button based on the number of answers
          ...currentQuestion.shuffledAnswers().map(
            (e) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Elevatedbutton(
                    data: e,
                    onPressed: () {
                      questionupdate(e);
                      // e represnt the answer
                    }),
              );
            },
          )
        ],
      ),
    );
  }
}
