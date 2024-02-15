import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizAppv1 extends StatefulWidget {
  const QuizAppv1({super.key});

  @override
  State<QuizAppv1> createState() => _MyWidgetState();
}

class QuestionsModel {
  final String? question;
  final List<String>? options;
  final int? rightIndex;

  const QuestionsModel({this.question, this.options, this.rightIndex});
}

class _MyWidgetState extends State<QuizAppv1> {
  List questionList = [
    const QuestionsModel(
        question:
            "Which HTTP method do we use to make an HTTP request to create a new resource?",
        options: ["POST", "PUT", "GET", "CREATE"],
        rightIndex: 0),
    const QuestionsModel(
        question:
            "Which HTTP method do we use to make an HTTP request to update an existing resource?",
        options: ["PUT", "UPDATE", "DELETE", "POST"],
        rightIndex: 0),
    const QuestionsModel(
        question: " What is the HTTP Status Code Related to Page Not Found?",
        options: ["402", "404", "403", "401"],
        rightIndex: 1),
    const QuestionsModel(
        question: "What is the HTTP Code Related to Internal Server Error?",
        options: ["502", "501", "204", "500"],
        rightIndex: 3),
    const QuestionsModel(
        question: "What is the protocol used in REST?",
        options: ["FTP", "HTTP", "JMX", "SOAP"],
        rightIndex: 1)
  ];
  int questionScreen = 0;
  int currentIndex = 0;
  int selectOption = -1;
  int correctAns = 0;
  bool notSelectoption = false;
  MaterialStateProperty<Color?> colorEffect(int option) {
    if (selectOption != -1) {
      if (option == questionList[currentIndex].rightIndex) {
        return const MaterialStatePropertyAll(Color.fromARGB(255, 8, 138, 12));
      } else if (option == selectOption) {
        return const MaterialStatePropertyAll(Color.fromARGB(255, 197, 23, 10));
      } else {
        return const MaterialStatePropertyAll(
            Color.fromARGB(255, 163, 224, 237));
      }
    } else {
      return const MaterialStatePropertyAll(Color.fromARGB(255, 163, 224, 237));
    }
  }

  Widget emojisetup() {
    if (correctAns >= 4) {
      return Image.network(
        "https://www.freepnglogos.com/uploads/trophy-png/trophy-with-golden-leaf-png-17.png",
        height: 350,
        width: 400,
      );
    } else if (correctAns >= 2) {
      return Image.network(
        "https://www.freepnglogos.com/uploads/trophy-png/gold-trophy-shiny-png-0.png",
        height: 350,
        width: 400,
      );
    } else {
      return Container(
          height: 350,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.only(top: 60),
          child: const Text(
            "Sorry, Your Score is Very Low!!!",
            style: TextStyle(
                fontSize: 50, color: Colors.black, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ));
    }
  }

  void nextQuestion() {
    if (selectOption == -1) {
      setState(() {
        notSelectoption = true;
      });
    }
    if (selectOption != -1 && currentIndex <= questionList.length - 1) {
      if (selectOption == questionList[currentIndex].rightIndex) {
        correctAns++;
      }
      selectOption = -1;
      // notSelectoption = false;
      setState(() {
        currentIndex++;
      });
      if (currentIndex == questionList.length) {
        setState(() {
          questionScreen = 2;
        });
      }
    }
  }

  Scaffold isAnsScreen() {
    if (questionScreen == 1) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.white,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 31, 96, 111),
          elevation: 300,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20), // Adjust the radius as needed
            ),
          ),
          title: Text(
            "QuizGround",
            style: GoogleFonts.playfairDisplay(
                fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          // color: Colors.blue[200],
          child: Center(
            child: Column(children: [
              Container(
                padding: const EdgeInsets.all(10),
                // height: 290,
                width: 328,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  // border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 31, 96, 111),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 8),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    Text(
                      "Question: ${currentIndex + 1}/${questionList.length} ",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Q.${currentIndex + 1} ${questionList[currentIndex].question}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: colorEffect(0),
                      shadowColor: const MaterialStatePropertyAll(Colors.black),
                      elevation: const MaterialStatePropertyAll(100),
                      side: const MaterialStatePropertyAll(BorderSide(
                          color: Color.fromARGB(255, 31, 96, 111), width: 1)),
                      fixedSize: const MaterialStatePropertyAll(Size(280, 50))),
                  onPressed: () {
                    setState(() {
                      if (selectOption == -1) {
                        selectOption = 0;
                        notSelectoption = false;
                      }
                    });
                  },
                  child: Text(
                    "A. ${questionList[currentIndex].options[0]}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: colorEffect(1),
                      shadowColor: const MaterialStatePropertyAll(Colors.black),
                      elevation: const MaterialStatePropertyAll(100),
                      side: const MaterialStatePropertyAll(BorderSide(
                          color: Color.fromARGB(255, 31, 96, 111), width: 1)),
                      fixedSize: const MaterialStatePropertyAll(Size(280, 50))),
                  onPressed: () {
                    setState(() {
                      if (selectOption == -1) {
                        selectOption = 1;
                        notSelectoption = false;
                      }
                    });
                  },
                  child: Text(
                    "B. ${questionList[currentIndex].options[1]}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: colorEffect(2),
                      shadowColor: const MaterialStatePropertyAll(Colors.black),
                      elevation: const MaterialStatePropertyAll(100),
                      side: const MaterialStatePropertyAll(BorderSide(
                          color: Color.fromARGB(255, 31, 96, 111), width: 1)),
                      fixedSize: const MaterialStatePropertyAll(Size(280, 50))),
                  onPressed: () {
                    setState(() {
                      if (selectOption == -1) {
                        selectOption = 2;
                        notSelectoption = false;
                      }
                    });
                  },
                  child: Text(
                    "C. ${questionList[currentIndex].options[2]}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: colorEffect(3),
                    shadowColor: const MaterialStatePropertyAll(Colors.black),
                    elevation: const MaterialStatePropertyAll(100),
                    side: const MaterialStatePropertyAll(BorderSide(
                        color: Color.fromARGB(255, 31, 96, 111), width: 1)),
                    fixedSize: const MaterialStatePropertyAll(Size(280, 50)),
                  ),
                  onPressed: () {
                    setState(() {
                      if (selectOption == -1) {
                        selectOption = 3;
                        notSelectoption = false;
                      }
                    });
                  },
                  child: Text(
                    "D. ${questionList[currentIndex].options[3]}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  )),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/bottomImg.png",
                height: 200,
                width: 300,
              ),
              notSelectoption == true
                  ? const Text(
                      "Please, select one option!!!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 223, 25, 11)),
                    )
                  : Container()
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 31, 96, 111),
          onPressed: nextQuestion,
          child: const Icon(
            Icons.navigate_next,
            color: Colors.white,
          ),
        ),
      );
    } else if (questionScreen == 2) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            // color: Colors.blue[200],
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              emojisetup(),
              const Text(
                "Congratualtion!!!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                child: Text(
                  "You have successfully completed with your Quiz",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "You score: $correctAns/${questionList.length}",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(120, 50),
                    backgroundColor: const Color.fromARGB(255, 31, 96, 111),
                  ),
                  onPressed: () {
                    currentIndex = 0;
                    selectOption = -1;
                    questionScreen = 0;
                    correctAns = 0;
                    setState(() {});
                  },
                  child: const Text("Restart",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )))
            ]),
          ),
          bottomSheet: const BottomAppBar(
            child: SizedBox(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Developed by "),
                    Text(
                      "❤️",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(" (NAIKPRIYANK)"),
                  ],
                ),
              ),
            ),
          ));
    } else {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "'-' Welcome To QuizGround '-'",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Image.asset(
                    "assets/Startscreen.jpg",
                    height: 400,
                    width: 800,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Press Below Button To Start Quiz...",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 31, 96, 111),
                          fixedSize: const Size.fromHeight(50)),
                      onPressed: () {
                        setState(() {
                          questionScreen = 1;
                        });
                      },
                      child: const Text(
                        "Start Quiz",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            ),
          ),
          bottomSheet: const BottomAppBar(
            child: SizedBox(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Developed by "),
                    Text(
                      "❤️",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(" (NAIKPRIYANK)"),
                  ],
                ),
              ),
            ),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return isAnsScreen();
  }
}
