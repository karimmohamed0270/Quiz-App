import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Screens/questionScreen.dart';
import 'package:quiz_app/Screens/widgets/elevated_button.dart';
import 'package:quiz_app/dataformodel/questionsdata.dart';

class Resultscreen extends StatelessWidget {
  List<String> selectedanswers = [];
  Resultscreen({super.key, required this.selectedanswers});

  List<Map<String, Object>> get_summary_answers() {
    final List<Map<String, Object>> Summary = [];

    for (var i = 0; i < selectedanswers.length; i++) {
      Summary.add(
        {
          "Question_index": i,
          "Question": myquestions[i].question,
          "Question_answer": myquestions[i].answers,
          "Your answer": selectedanswers[i],
          "Correct": myquestions[i].corcetanswer,
        },
      );
    }
    return Summary;
  }

  @override
  Widget build(BuildContext context) {
    int num_correct_answer = 0;
    //  final getsummary=get_summary_answers();

    // to calculatr number of correct answer:
    for (var i = 0; i < get_summary_answers().length; i++) {
      if (get_summary_answers()[i]["Correct"] ==
          get_summary_answers()[i]["Your answer"]) {
        num_correct_answer += 1;
      }
    }
    // end calculate
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.red,
            Color.fromARGB(186, 153, 76, 175),
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your degree is ${num_correct_answer} / ${myquestions.length}",
                style: GoogleFonts.abel(
                    color: Colors.black,
                    fontSize: 30,
                    decoration: TextDecoration.none),
              ),
              const SizedBox(
                height: 30,
              ),
              ...get_summary_answers().map((e) {
                return Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: e["Question_answer"] == e["Your answer"]
                          ? Colors.green
                          : Colors.red,
                      child: Text(((e["Question_index"] as int) + 1).toString(),
                          style: GoogleFonts.abel(
                            color: Colors.black,
                            fontSize: 30,
                            decoration: TextDecoration.none,
                          )),
                    ),
                    Text(e["Question"].toString(),
                        style: GoogleFonts.abel(
                            color: Colors.black,
                            fontSize: 30,
                            decoration: TextDecoration.none)),
                    Text(e["Question_answer"].toString(),
                        style: GoogleFonts.abel(
                            color: Colors.black,
                            fontSize: 30,
                            decoration: TextDecoration.none)),
                    Text(e["Your answer"].toString(),
                        style: GoogleFonts.abel(
                            color: Colors.blue,
                            fontSize: 30,
                            decoration: TextDecoration.none)),
                    Text(e["Correct"].toString(),
                        style: GoogleFonts.abel(
                            color: Colors.green,
                            fontSize: 30,
                            decoration: TextDecoration.none)),
                  ],
                );
              }),
              Elevatedbutton(
                data: "Restart",
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => QuestionScreen() ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
