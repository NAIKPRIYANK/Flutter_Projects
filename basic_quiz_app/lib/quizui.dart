import 'dart:html';

import 'package:flutter/material.dart';

class Quizui extends StatefulWidget {
  const Quizui({super.key});

  @override
  State<Quizui> createState() => _QuizuiState();
}

class _QuizuiState extends State<Quizui> {
  int counter = 1;
  bool ansSelected = false;
  String correctAns = '';
  String selectAns = '';
  int score = 0;
  Widget createOption(String option) {
    Color backgroundColor = Colors.blue;
    correctAns = questions[counter - 1]['correctAnswer'];

    if (ansSelected) {
      if (option == correctAns) {
        backgroundColor = Colors.green; 
      } else if (option == selectAns) {
        backgroundColor = Colors.red; 
      }
    }

    return Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: backgroundColor,
        ),
        height: 30,
        width: 350,
        // color: Colors.blue,
        child: TextButton(
          onPressed: () {
            if (!ansSelected) {
              checkans(option);
            }
          },
          child: Text(
            option,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }

  void checkans(String selectOpt) {
    setState(() {
      ansSelected = true;
      selectAns = selectOpt;
      correctAns = questions[counter - 1]['correctAnswer'];
      if (correctAns == selectAns) {
        score++;
      }
      // print(score);
    });
  }

  // void nextQuestion() {
  //   setState(() {
  //     // counter++;
  //     ansSelected = false;
  //     selectAns = '';
  //     if (counter > questions.length) {
  //       counter = 1;
  //     }
  //   });
  // }

  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is flutter?',
      'options': [
        'Mobile App Framework',
        'Database Management System',
        'Programming Language',
        'Machine Learning Library'
      ],
      'correctAnswer': 'Mobile App Framework',
    },
    {
      'question': 'What is Widget?',
      'options': ['class', 'Function', 'Variable', 'Specifier'],
      'correctAnswer': 'class',
    },
    {
      'question': 'Which is not type of contructor?',
      'options': ['Factory Constuructor', 'Named', 'Pameterized', 'Copy'],
      'correctAnswer': 'Copy',
    },
    {
      'question': 'What is Mixin?',
      'options': ['class', 'Variable', 'Function', 'Constructor'],
      'correctAnswer': 'class',
    },
    {
      'question': 'What is Return type of Build method?',
      'options': ['Widget', 'int', 'String', 'var'],
      'correctAnswer': 'Widget',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tech Quiz"),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: Column(
        children: [
          Text("Question No $counter/5"),
          Text(questions[counter - 1]['question']),
          for (var option in questions[counter - 1]['options'])
            createOption(option)
        ],
      )),
      floatingActionButton: Row(
        children: [
          const SizedBox(
            width: 30,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter--;
                if (counter < 1) {
                  counter = 5;
                }
              });
            },
            child: const Icon(Icons.skip_previous),
          ),
          const SizedBox(
            width: 210,
          ),
          FloatingActionButton(
              onPressed: () {
                setState(() {
                  ansSelected = false;
                  selectAns = '';
                  counter++;
                  if (counter == questions.length + 1) {
                    counter = 1;
                  }
                });
              },
              child: counter >= 5
                  ? const Icon(Icons.done)
                  : const Icon(Icons.navigate_next)),
        ],
      ),
    );
  }
}
