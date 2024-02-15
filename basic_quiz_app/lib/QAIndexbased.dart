// import 'package:flutter/material.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class QuestionsModel {
//   final String? question;
//   final List<String>? options;
//   final int? rightIndex;

//   const QuestionsModel({this.question, this.options, this.rightIndex});
// }

// class _MyWidgetState extends State<MyWidget> {
//   List questionList = [
//     const QuestionsModel(
//         question:
//             "Which HTTP method do we use to make an HTTP request to create a new resource?",
//         options: ["POST", "PUT", "GET", "CREATE"],
//         rightIndex: 0),
//     const QuestionsModel(
//         question:
//             "Which HTTP method do we use to make an HTTP request to update an existing resource?",
//         options: ["PUT", "UPDATE", "DELETE", "POST"],
//         rightIndex: 0),
//     const QuestionsModel(
//         question: " What is the HTTP Status Code Related to Page Not Found?",
//         options: ["402", "404", "403", "401"],
//         rightIndex: 1),
//     const QuestionsModel(
//         question: "What is the HTTP Code Related to Internal Server Error?",
//         options: ["502", "501", "204", "500"],
//         rightIndex: 3),
//     const QuestionsModel(
//         question: "What is the protocol used in REST?",
//         options: ["FTP", "HTTP", "JMX", "SOAP"],
//         rightIndex: 1)
//   ];
//   bool questionScreen = true;
//   int currentIndex = 0;
//   int selectOption = -1;
//   int correctAns = 0;
//   bool notSelectoption = false;
//   MaterialStateProperty<Color?> colorEffect(int option) {
//     if (selectOption != -1) {
//       if (option == questionList[currentIndex].rightIndex) {
//         return const MaterialStatePropertyAll(Color.fromARGB(255, 8, 138, 12));
//       } else if (option == selectOption) {
//         return const MaterialStatePropertyAll(Color.fromARGB(255, 197, 23, 10));
//       } else {
//         return const MaterialStatePropertyAll(Colors.white);
//       }
//     } else {
//       return const MaterialStatePropertyAll(Colors.white);
//     }
//   }

//   Image emojisetup() {
//     if (correctAns == 5) {
//       return Image.network(
//         "https://www.freepnglogos.com/uploads/trophy-png/trophy-with-golden-leaf-png-17.png",
//         height: 350,
//         width: 400,
//       );
//     } else if (correctAns >= 3) {
//       return Image.network(
//         "https://www.freepnglogos.com/uploads/trophy-png/gold-trophy-shiny-png-0.png",
//         height: 350,
//         width: 400,
//       );
//     } else {
//       return Image.network(
//         "https://www.freepnglogos.com/uploads/trophy-png/trophy-award-transparent-background-image-23.png",
//         height: 350,
//         width: 400,
//       );
//     }
//   }

//   void nextQuestion() {
//     if (selectOption == -1) {
//       setState(() {
//         notSelectoption = true;
//       });
//     }
//     if (selectOption != -1 && currentIndex <= questionList.length - 1) {
//       if (selectOption == questionList[currentIndex].rightIndex) {
//         correctAns++;
//       }
//       selectOption = -1;
//       // notSelectoption = false;
//       setState(() {
//         currentIndex++;
//       });
//       if (currentIndex == questionList.length) {
//         setState(() {
//           questionScreen = false;
//         });
//       }
//     }
//   }

//   Scaffold isAnsScreen() {
//     if (questionScreen) {
//       return Scaffold(
//         backgroundColor: Colors.blue,
//         appBar: AppBar(
//           foregroundColor: Colors.blue[200],
//           centerTitle: true,
//           backgroundColor: Colors.black,
//           // elevation: 300,
//           shadowColor: Colors.blue.shade900,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(
//               bottom: Radius.circular(20), // Adjust the radius as needed
//             ),
//           ),
//           title: const Text(
//             "Quiz App",
//             style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
//           ),
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//               color: Colors.blue[100],
//               borderRadius: const BorderRadius.all(Radius.circular(20))),
//           // color: Colors.blue[200],
//           child: Center(
//             child: Column(children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "Question: ${currentIndex + 1}/${questionList.length} ",
//                 style:
//                     const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: const EdgeInsets.all(15),
//                 height: 150,
//                 width: 340,
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     // border: Border.all(color: Colors.black),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black,
//                         spreadRadius: 2,
//                         blurRadius: 9,
//                         offset: Offset(0, 2),
//                       )
//                     ],
//                     color: Colors.white),
//                 child: Text(
//                   "Q.${currentIndex + 1} ${questionList[currentIndex].question}",
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               ElevatedButton(
//                   style: ButtonStyle(
//                       backgroundColor: colorEffect(0),
//                       side: const MaterialStatePropertyAll(
//                           BorderSide(color: Colors.black, width: 2)),
//                       fixedSize: const MaterialStatePropertyAll(Size(300, 60))),
//                   onPressed: () {
//                     setState(() {
//                       if (selectOption == -1) {
//                         selectOption = 0;
//                         notSelectoption = false;
//                       }
//                     });
//                   },
//                   child: Text(
//                     "A. ${questionList[currentIndex].options[0]}",
//                     style: const TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w800),
//                   )),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                   style: ButtonStyle(
//                       backgroundColor: colorEffect(1),
//                       side: const MaterialStatePropertyAll(
//                           BorderSide(color: Colors.black, width: 2)),
//                       fixedSize: const MaterialStatePropertyAll(Size(300, 60))),
//                   onPressed: () {
//                     setState(() {
//                       if (selectOption == -1) {
//                         selectOption = 1;
//                         notSelectoption = false;
//                       }
//                     });
//                   },
//                   child: Text(
//                     "B. ${questionList[currentIndex].options[1]}",
//                     style: const TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w800),
//                   )),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                   style: ButtonStyle(
//                       backgroundColor: colorEffect(2),
//                       side: const MaterialStatePropertyAll(
//                           BorderSide(color: Colors.black, width: 2)),
//                       fixedSize: const MaterialStatePropertyAll(Size(300, 60))),
//                   onPressed: () {
//                     setState(() {
//                       if (selectOption == -1) {
//                         selectOption = 2;
//                         notSelectoption = false;
//                       }
//                     });
//                   },
//                   child: Text(
//                     "C. ${questionList[currentIndex].options[2]}",
//                     style: const TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w800),
//                   )),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: colorEffect(3),
//                     side: const MaterialStatePropertyAll(
//                         BorderSide(color: Colors.black, width: 2)),
//                     fixedSize: const MaterialStatePropertyAll(Size(300, 60)),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       if (selectOption == -1) {
//                         selectOption = 3;
//                         notSelectoption = false;
//                       }
//                     });
//                   },
//                   child: Text(
//                     "D. ${questionList[currentIndex].options[3]}",
//                     style: const TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w800),
//                   )),
//               notSelectoption == true
//                   ? Container(
//                       margin: const EdgeInsets.only(top: 50),
//                       padding: const EdgeInsets.only(top: 10),
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black),
//                           color: Colors.white,
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(20))),
//                       height: 50,
//                       width: 200,
//                       // color: Colors.blue,
//                       child: const Text(
//                         "Please select one option!!!",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontWeight: FontWeight.w800,
//                             color: Color.fromARGB(255, 223, 25, 11)),
//                       ),
//                     )
//                   : Container()
//             ]),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.black,
//           onPressed: nextQuestion,
//           child: Icon(
//             Icons.forward,
//             color: Colors.blue[200],
//           ),
//         ),
//       );
//     } else {
//       return Scaffold(
//         backgroundColor: Colors.blue,
//         appBar: AppBar(
//           foregroundColor: Colors.blue[200],
//           centerTitle: true,
//           backgroundColor: Colors.black,
//           elevation: 300,
//           shadowColor: Colors.blue.shade900,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(
//               bottom: Radius.circular(20), // Adjust the radius as needed
//             ),
//           ),
//           title: const Text(
//             "Quiz App",
//             style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
//           ),
//         ),
//         body: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//               color: Colors.blue[100],
//               borderRadius: const BorderRadius.all(Radius.circular(20))),
//           // color: Colors.blue[200],
//           child: Column(children: [
//             const SizedBox(
//               height: 20,
//             ),
//             emojisetup(),
//             const Text(
//               "Congratualtion!!!",
//               style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
//             ),
//             const Text(
//               "You Are Completed with Quiz",
//               style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
//             ),
//             Text(
//               "You score: $correctAns/${questionList.length}",
//               style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: const Size(120, 40),
//                   backgroundColor: Colors.black,
//                 ),
//                 onPressed: () {
//                   currentIndex = 0;
//                   selectOption = -1;
//                   questionScreen = true;
//                   correctAns = 0;
//                   setState(() {});
//                 },
//                 child: Text("Reset",
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.blue[200],
//                     )))
//           ]),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isAnsScreen();
//   }
// }
