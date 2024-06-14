import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/Home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.red,
                  Color.fromARGB(186, 153, 76, 175),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Home_Screen())));
  }
}
