import 'dart:html';

import 'package:flutter/material.dart';

class ModelClass extends StatefulWidget {
  const ModelClass({super.key});

  @override
  State<ModelClass> createState() => _ModelClassState();
}

class QuestionModel {
  final String? question;
  final List<String>? options;
  final int? rightIndex;

  const QuestionModel({this.question, this.options, this.rightIndex});
}

class _ModelClassState extends State<ModelClass> {
  bool questionscreen = true;
  int questionIndex = 0;
  int selectOption = -1;
  int correctans = 0;

  List questionList = [
    const QuestionModel(
        question: "Who is Founder of Microsoft?",
        options: ["Steve Jobs", "Jef Bezos", "Bill Gates", "Elon Musk"],
        rightIndex: 2),
    const QuestionModel(
        question: "Who is Founder of Amazon?",
        options: ["Steve Jobs", "Jef Bezos", "Bill Gates", "Elon Musk"],
        rightIndex: 1),
    const QuestionModel(
        question: "Who is Founder of Apple?",
        options: ["Steve Jobs", "Jef Bezos", "Bill Gates", "Elon Musk"],
        rightIndex: 0),
    const QuestionModel(
        question: "Who is Founder of Tesla?",
        options: ["Steve Jobs", "Jef Bezos", "Bill Gates", "Elon Musk"],
        rightIndex: 3),
    const QuestionModel(
        question: "Who is Founder of Google?",
        options: ["Steve Jobs", "Lary Page", "Bill Gates", "Elon Musk"],
        rightIndex: 1)
  ];
  Color colorDepend(int button) {
    if (selectOption != -1) {
      if (button == questionList[questionIndex].rightIndex) {
        return Colors.green;
      } else if (button == selectOption) {
        return Colors.red;
      } else {
        return Colors.blue;
      }
    } else {
      return Colors.blue;
    }
  }

  void checkingans() {
    if (selectOption != -1 && questionIndex <= questionList.length - 1) {
      if (selectOption == questionList[questionIndex].rightIndex) {
        correctans++;
      }
      if (questionIndex == questionList.length - 1) {
        questionscreen = false;
      }
      setState(() {
        selectOption = -1;
        questionIndex++;
      });
    }
  }

  Scaffold isQuestionscreen() {
    if (questionscreen == true) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text(
            "Quiz app",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Question: ${questionIndex + 1}/${questionList.length}",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: 330,
                child: Text(
                  "Q.${questionIndex + 1}.${questionList[questionIndex].question}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorDepend(0),
                      fixedSize: const Size.fromWidth(200)),
                  onPressed: () {
                    if (selectOption == -1) {
                      setState(() {
                        selectOption = 0;
                      });
                    }
                  },
                  child: Text(
                    questionList[questionIndex].options[0],
                    style: const TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorDepend(1),
                      fixedSize: const Size.fromWidth(200)),
                  onPressed: () {
                    if (selectOption == -1) {
                      setState(() {
                        selectOption = 1;
                      });
                    }
                  },
                  child: Text(
                    questionList[questionIndex].options[1],
                    style: const TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorDepend(2),
                      fixedSize: const Size.fromWidth(200)),
                  onPressed: () {
                    if (selectOption == -1) {
                      setState(() {
                        selectOption = 2;
                      });
                    }
                  },
                  child: Text(
                    questionList[questionIndex].options[2],
                    style: const TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorDepend(3),
                      fixedSize: const Size.fromWidth(200)),
                  onPressed: () {
                    if (selectOption == -1) {
                      setState(() {
                        selectOption = 3;
                      });
                    }
                  },
                  child: Text(
                    questionList[questionIndex].options[3],
                    style: const TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            checkingans();
          },
          child: const Icon(Icons.forward),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text(
            "Quiz app",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.network(
                "https://www.pngitem.com/pimgs/m/267-2675669_trophy-congratulations-for-winning-contest-hd-png-download.png",
                height: 300,
                width: 400,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Congratulation !!!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "You are Completed with Quiz.",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
              ),
              Text(
                "Your score:$correctans/${questionList.length}",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectOption = -1;
                      questionscreen = true;
                      questionIndex = 0;
                    });
                  },
                  child: const Text("Reset"))
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionscreen();
  }
}
