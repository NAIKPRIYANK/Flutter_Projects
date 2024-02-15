// import 'dart:html';

// import 'package:flutter/material.dart';

// class Quizui extends StatefulWidget {
//   const Quizui({super.key});

//   @override
//   State<Quizui> createState() => _QuizuiState();
// }

// class _QuizuiState extends State<Quizui> {
//   int counter = 1;
//   bool ansSelected = false;
//   String correctAns = '';
//   String selectAns = '';
//   int score = 0;
//   Widget createOption(String option, int currentInd) {
//     Color backgroundColor = Colors.blueGrey;
//     correctAns = questions[currentInd]['correctAnswer'];

//     if (ansSelected) {
//       if (option == correctAns) {
//         backgroundColor = Colors.green; // Correct answer in green
//       } else if (option == selectAns) {
//         backgroundColor = Colors.red; // Selected (wrong) answer in red
//       }
//     }

//     return Container(
//         margin: const EdgeInsets.only(top: 20),
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(20)),
//           color: backgroundColor,
//         ),
//         height: 30,
//         width: 350,
//         // color: Colors.blue,
//         child: TextButton(
//           onPressed: () {
//             if (!ansSelected) {
//               checkans(option);
//             }
//           },
//           child: Text(
//             option,
//             style: const TextStyle(color: Colors.white),
//           ),
//         ));
//   }

//   void checkans(String selectOpt) {
//     setState(() {
//       ansSelected = true;
//       selectAns = selectOpt;
//       correctAns = questions[counter - 1]['correctAnswer'];
//       if (correctAns == selectAns) {
//         score++;
//       }
//       // print(score);
//     });
//   }

//   // void nextQuestion() {
//   //   setState(() {
//   //     // counter++;
//   //     ansSelected = false;
//   //     selectAns = '';
//   //     if (counter > questions.length) {
//   //       counter = 1;
//   //     }
//   //   });
//   // }

//   int index = 0;
//   List<Map<String, dynamic>> questions = [
//     {
//       'question': 'What is flutter?',
//       'options': [
//         'Mobile App Framework',
//         'Database Management System',
//         'Programming Language',
//         'Machine Learning Library'
//       ],
//       'correctAnswer': 'Mobile App Framework',
//     },
//     {
//       'question': 'What is Widget?',
//       'options': ['class', 'Function', 'Variable', 'Specifier'],
//       'correctAnswer': 'class',
//     },
//     {
//       'question': 'Which is not type of contructor?',
//       'options': ['Factory Constuructor', 'Named', 'Pameterized', 'Copy'],
//       'correctAnswer': 'Copy',
//     },
//     {
//       'question': 'What is Mixin?',
//       'options': ['class', 'Variable', 'Function', 'Constructor'],
//       'correctAnswer': 'class',
//     },
//     {
//       'question': 'What is Return type of Build method?',
//       'options': ['Widget', 'int', 'String', 'var'],
//       'correctAnswer': 'Widget',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Tech Quiz"),
//         backgroundColor: Colors.deepPurple[50],
//       ),
//       body: ListView.builder(
//           itemCount: questions.length,
//           itemBuilder: (context, index) {
//             return Center(
//                 child: Column(
//               children: [
//                 Text("Question No ${index + 1}/5"),
//                 Text(questions[index]['question']),
//                 for (var option in questions[index]['options'])
//                   createOption(option, index),
//                 const SizedBox(
//                   height: 50,
//                 ),
//               ],
//             ));
//           }),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class QuizUI extends StatefulWidget {
//   const QuizUI({Key? key}) : super(key: key);

//   @override
//   State<QuizUI> createState() => _QuizUIState();
// }

// class _QuizUIState extends State<QuizUI> {
//   int score = 0;
//   late List<Map<String, dynamic>> questions;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize questions with userAnswer field
//     questions = List<Map<String, dynamic>>.from([
//       {
//         'question': 'What is flutter?',
//         'options': [
//           'Mobile App Framework',
//           'Database Management System',
//           'Programming Language',
//           'Machine Learning Library'
//         ],
//         'correctAnswer': 'Mobile App Framework',
//         'userAnswer': '',
//       },
//       {
//         'question': 'What is Widget?',
//         'options': ['class', 'Function', 'Variable', 'Specifier'],
//         'correctAnswer': 'class',
//         'userAnswer': '',
//       },
//       {
//         'question': 'Which is not type of contructor?',
//         'options': ['Factory Constuructor', 'Named', 'Pameterized', 'Copy'],
//         'correctAnswer': 'Copy',
//         'userAnswer': '',
//       },
//       {
//         'question': 'What is Mixin?',
//         'options': ['class', 'Variable', 'Function', 'Constructor'],
//         'correctAnswer': 'class',
//         'userAnswer': '',
//       },
//       {
//         'question': 'What is Return type of Build method?',
//         'options': ['Widget', 'int', 'String', 'var'],
//         'correctAnswer': 'Widget',
//         'userAnswer': '',
//       },
//     ]);
//   }

//   Widget createOption(String option, int currentIndex) {
//     final Color backgroundColor = _getBackgroundColor(currentIndex, option);
//     return Container(
//       margin: const EdgeInsets.only(top: 20),
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(20)),
//         color: backgroundColor,
//       ),
//       height: 30,
//       width: 350,
//       child: TextButton(
//         onPressed: () {
//           if (questions[currentIndex]['userAnswer'].isEmpty) {
//             _checkAnswer(currentIndex, option);
//           }
//         },
//         child: Text(
//           option,
//           style: const TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }

//   Color _getBackgroundColor(int currentIndex, String option) {
//     final String correctAns = questions[currentIndex]['correctAnswer'];
//     final String selectedAns = questions[currentIndex]['userAnswer'];
//     if (selectedAns.isNotEmpty) {
//       if (option == correctAns) {
//         return Colors.green; // Correct answer in green
//       } else if (option == selectedAns) {
//         return Colors.red; // Selected (wrong) answer in red
//       }
//     }
//     return Colors.blueGrey; // Default color
//   }

//   void _checkAnswer(int currentIndex, String selectedOption) {
//     setState(() {
//       questions[currentIndex]['userAnswer'] = selectedOption;
//       if (selectedOption == questions[currentIndex]['correctAnswer']) {
//         score++;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Tech Quiz"),
//         backgroundColor: Colors.deepPurple[50],
//       ),
//       body: ListView.builder(
//         itemCount: questions.length,
//         itemBuilder: (context, index) {
//           return Center(
//             child: Column(
//               children: [
//                 Text("Question No ${index + 1}/5"),
//                 Text(questions[index]['question']),
//                 for (var option in questions[index]['options'])
//                   createOption(option, index),
//                 const SizedBox(
//                   height: 50,
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class QuizUI extends StatefulWidget {
  const QuizUI({Key? key}) : super(key: key);

  @override
  State<QuizUI> createState() => _QuizUIState();
}

class _QuizUIState extends State<QuizUI> {
  int score = 0;
  late List<Map<String, dynamic>> questions;

  @override
  void initState() {
    super.initState();

    questions = List<Map<String, dynamic>>.from([
      {
        'question': 'What is flutter?',
        'options': [
          'Mobile App Framework',
          'Database Management System',
          'Programming Language',
          'Machine Learning Library'
        ],
        'correctAnswer': 'Mobile App Framework',
        'userAnswer': '',
      },
      {
        'question': 'What is Widget?',
        'options': ['class', 'Function', 'Variable', 'Specifier'],
        'correctAnswer': 'class',
        'userAnswer': '',
      },
      {
        'question': 'Which is not type of contructor?',
        'options': ['Factory Constuructor', 'Named', 'Pameterized', 'Copy'],
        'correctAnswer': 'Copy',
        'userAnswer': '',
      },
      {
        'question': 'What is Mixin?',
        'options': ['class', 'Variable', 'Function', 'Constructor'],
        'correctAnswer': 'class',
        'userAnswer': '',
      },
      {
        'question': 'What is Return type of Build method?',
        'options': ['Widget', 'int', 'String', 'var'],
        'correctAnswer': 'Widget',
        'userAnswer': '',
      },
    ]);
  }

  Widget createOption(String option, int currentIndex) {
    final Color backgroundColor = _getBackgroundColor(currentIndex, option);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: backgroundColor,
      ),
      height: 30,
      width: 350,
      child: TextButton(
        onPressed: () {
          if (questions[currentIndex]['userAnswer'].isEmpty) {
            _checkAnswer(currentIndex, option);
          }
        },
        child: Text(
          option,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Color _getBackgroundColor(int currentIndex, String option) {
    final String correctAns = questions[currentIndex]['correctAnswer'];
    final String selectedAns = questions[currentIndex]['userAnswer'];
    if (selectedAns.isNotEmpty) {
      if (option == correctAns) {
        return Colors.green;
      } else if (option == selectedAns) {
        return Colors.red;
      }
    }
    return Colors.blueGrey; // Default color
  }

  void _checkAnswer(int currentIndex, String selectedOption) {
    setState(() {
      questions[currentIndex]['userAnswer'] = selectedOption;
      if (selectedOption == questions[currentIndex]['correctAnswer']) {
        score++;
      }
    });
  }

  bool allQuestionsAnswered() {
    for (var question in questions) {
      if (question['userAnswer'].isEmpty) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tech Quiz"),
        backgroundColor: Colors.deepPurple[50],
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              children: [
                Text("Question No ${index + 1}/5"),
                Text(questions[index]['question']),
                for (var option in questions[index]['options'])
                  createOption(option, index),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        },
      ),
      bottomSheet: allQuestionsAnswered()
          ? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[400],
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ]),
              padding: const EdgeInsets.all(20),
              // color: Colors.blueGrey,
              child: Text(
                'Your Score: $score/5',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}
