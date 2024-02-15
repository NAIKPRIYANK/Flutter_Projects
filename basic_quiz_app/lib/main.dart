// import 'package:flutter/material.dart';
// import 'package:quiz_app/Modelclass.dart';
// import 'package:quiz_app/QAIndexbased.dart';
// // import 'package:quiz_app/QuizApp.dart';
// // import 'package:quiz_app/practice.dart';
// // import 'package:quiz_app/quizui.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//         debugShowCheckedModeBanner: false, home: ModelClass());
//   }
// }

import 'package:flutter/material.dart';
// import 'package:quiz_app/Modelclass.dart';
import 'package:quiz_app/QAIndexbased.dart';
import 'package:quiz_app/StartScreen.dart';
import 'package:quiz_app/QuizAppV1.dart';
// import 'package:quiz_app/QuizApp.dart';
// import 'package:quiz_app/practice.dart';
// import 'package:quiz_app/quizui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: QuizAppv1());
  }
}
