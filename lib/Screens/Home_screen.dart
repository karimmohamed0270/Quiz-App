import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/questionscreen.dart';

class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            height: 250,
          ),
          SizedBox(
            height: 40,
          ),
          Text("Time for learning",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionScreen(), 
                    ));
              },
              icon: Icon(Icons.start_sharp),
              label: Text("Quiz"),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
