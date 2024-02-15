import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  bool answerSelected = false;
  int questionIndex = 0;
  String correans = '';
  String selctans = '';
  int score = 0;
  int count = 0;
  bool flag = false;

  // Widget option() {}
  List<Map> questionList = [
    {
      "question": "Who is Founder of Microsoft?",
      'options': ["Steve Jobs", "Jef Bezos", "Bill Gates", "Elon Musk"],
      "RightIndex": "Bill Gates"
    },
    {
      "question": "Who is Founder of Amazon?",
      'options': ["Steve Jobs", "Jef Bezos", "Bill Gates", "Elon Musk"],
      "RightIndex": "Jef Bezos"
    },
    {
      "question": "Who is Founder of Apple?",
      'options': ["Steve Jobs", "Jef Bezos", "Bill Gates", "Elon Musk"],
      "RightIndex": "Steve Jobs"
    },
    {
      "question": "Who is Founder of Tesla?",
      'options': ["Steve Jobs", "Jef Bezos", "Bill Gates", "Elon Musk"],
      "RightIndex": "Elon Musk"
    },
    {
      "question": "Who is Founder of Google?",
      'options': ["Steve Jobs", "Lary Page", "Bill Gates", "Elon Musk"],
      "RightIndex": "Lary Page"
    }
  ];

  Image emojisetup() {
    if (score == 5) {
      return Image.asset(
        "assets/VeryGood.png",
        height: 150,
        width: 150,
      );
    } else if (score >= 3) {
      return Image.asset(
        "assets/good.png",
        height: 150,
        width: 150,
      );
    } else {
      return Image.asset(
        "assets/Average.png",
        height: 150,
        width: 150,
      );
    }
  }

  // bool checkAnswer() {}
  Color checkAns(String option) {
    // selctans = index;
    correans = questionList[questionIndex]["RightIndex"];
    if (answerSelected) {
      if (option == correans) {
        return Colors.green;
      } else if (selctans == option) {
        return Colors.red;
      }
    }
    return Colors.blue;
  }

  void isAns(String option) {
    setState(() {
      answerSelected = true;
      selctans = option;
      correans = questionList[questionIndex]["RightIndex"];
      if (correans == option) {
        score++;
      }
    });
  }

  void resetfunctionality() {
    answerSelected = false;
    flag = false;
    selctans = '';
  }

  bool questionScreen = true;
  Scaffold isAnswerScreen() {
    if (questionScreen == true) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Quiz App",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.orange),
          ),
          backgroundColor: Colors.blue[400],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Question : ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                Text(
                  "${questionIndex + 1}/${questionList.length}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 50,
                width: 220,
                child: Text(
                  questionList[questionIndex]["question"],
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400),
                )),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(210),
                    backgroundColor:
                        checkAns(questionList[questionIndex]["options"][0])),
                onPressed: () {
                  flag = true;
                  if (!answerSelected) {
                    isAns(questionList[questionIndex]["options"][0]);
                  }
                },
                child: Text(
                  "A. ${questionList[questionIndex]["options"][0]}",
                  style: const TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(210),
                backgroundColor:
                    checkAns(questionList[questionIndex]["options"][1]),
              ),
              onPressed: () {
                flag = true;
                if (!answerSelected) {
                  isAns(questionList[questionIndex]["options"][1]);
                }
                ;
              },
              child: Text("B. ${questionList[questionIndex]["options"][1]}",
                  style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(210),
                    backgroundColor:
                        checkAns(questionList[questionIndex]["options"][2])),
                onPressed: () {
                  flag = true;
                  if (!answerSelected) {
                    isAns(questionList[questionIndex]["options"][2]);
                  }
                  ;
                },
                child: Text("C. ${questionList[questionIndex]["options"][2]}",
                    style: const TextStyle(color: Colors.white))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(210),
                    backgroundColor:
                        checkAns(questionList[questionIndex]["options"][3])),
                onPressed: () {
                  flag = true;
                  if (!answerSelected) {
                    isAns(questionList[questionIndex]["options"][3]);
                  }
                  ;
                },
                child: Text("D. ${questionList[questionIndex]["options"][3]}",
                    style: const TextStyle(color: Colors.white))),
            const SizedBox(
              height: 10,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[400],
          onPressed: () {
            setState(() {
              if (questionIndex <= questionList.length - 1 && flag) {
                questionIndex++;
                resetfunctionality();
                if (questionIndex == questionList.length) {
                  questionScreen = false;
                }
              }
            });
          },
          child: const Icon(
            Icons.forward,
            color: Colors.orange,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Quiz App",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.orange),
          ),
          backgroundColor: Colors.blue[400],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200],
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.orange,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),

                // color: Colors.black,
                height: 90,
                width: 200,
                child: Text(
                  "Your Score is $score/${questionList.length}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              emojisetup(),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400]),
                  onPressed: () {
                    setState(() {
                      questionIndex = 0;
                      score = 0;
                      questionScreen = true;
                      answerSelected = false;
                      isAnswerScreen();
                    });
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isAnswerScreen();
  }
}
