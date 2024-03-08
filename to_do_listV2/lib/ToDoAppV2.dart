// // import 'dart:js_interop';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:to_do_list/auth/login.dart';
// import 'package:to_do_list/auth/register.dart';
// // import 'package:to_do_list/practice2.dart';

// class ToDoAppV1 extends StatefulWidget {
//   final String uName;
//   const ToDoAppV1({super.key, required this.uName});
//   @override
//   State<ToDoAppV1> createState() {
//     return _ToDoAppV1State();
//   }
// }

// //========================================Model Class:To Store data in obj and pass to the list ==========================================

// class ModelClassTodo {
//   String title;
//   String description;
//   String date;
//   ModelClassTodo(
//       {required this.title, required this.description, required this.date});
// }

// class _ToDoAppV1State extends State<ToDoAppV1> {
//   //=========================TextEditingController :To store data from textfields=======================================================
//   TextEditingController titlecontroller = TextEditingController();
//   TextEditingController descriptioncontroller = TextEditingController();
//   TextEditingController datecontroller = TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   // ======================================colorList====================================================================================
//   List<Color> caardColors = [
//     const Color.fromRGBO(250, 232, 232, 1),
//     const Color.fromRGBO(232, 237, 250, 1),
//     const Color.fromRGBO(250, 249, 232, 1),
//     const Color.fromRGBO(250, 232, 250, 1),
//   ];
//   // ==========================================Empty List to store data in obj form=========================================================
//   List taskList = [];

//   //=========================================Submit function by a conditions==============================================================
//   //Use Optional parameter: useful for satisfying requirement as of is there submit button for adding new task or editing already added task
//   void onSubmit(bool addTask, [ModelClassTodo? todoObj]) {
//     if (titlecontroller.text.trim().isNotEmpty &&
//         descriptioncontroller.text.trim().isNotEmpty &&
//         datecontroller.text.trim().isNotEmpty) {
//       if (addTask) {
//         setState(() {
//           taskList.add(
//             ModelClassTodo(
//                 title: titlecontroller.text.trim(),
//                 description: descriptioncontroller.text.trim(),
//                 date: datecontroller.text.trim()),
//           );
//         });
//       } else {
//         setState(() {
//           todoObj!.title = titlecontroller.text.trim();
//           todoObj.description = descriptioncontroller.text.trim();
//           todoObj.date = datecontroller.text.trim();
//         });
//       }
//       clearField();

//       Navigator.of(context).pop();
//     }
//   }

//   //=========================================To edit task=========================================================================

//   void editingTask(ModelClassTodo todoObj) {
//     titlecontroller.text = todoObj.title;
//     descriptioncontroller.text = todoObj.description;
//     datecontroller.text = todoObj.date;
//     _bottomsheetshower(false, todoObj);
//   }

//   //==========================================To delete obj directly from a list===================================================

//   void deleteTask(ModelClassTodo todoObj) {
//     _showMyDialog(todoObj);
//   }

//   // =========================================Dialouge box for confirmation of delete task==========================================

//   Future<void> _showMyDialog(ModelClassTodo todoObj) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Confirm to delete'),
//           content: const SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text('Are you sure want to delete this Task?'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             Row(
//               children: [
//                 TextButton(
//                   style: TextButton.styleFrom(
//                       backgroundColor: const Color.fromRGBO(0, 139, 148, 1)),
//                   child:
//                       const Text('No', style: TextStyle(color: Colors.white)),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     if (taskList.isEmpty) {
//                       setState(() {});
//                     }
//                   },
//                 ),
//                 const Spacer(),
//                 TextButton(
//                   style: TextButton.styleFrom(
//                       backgroundColor: const Color.fromRGBO(0, 139, 148, 1)),
//                   child: const Text(
//                     'Yes',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       taskList.remove(todoObj);
//                       Navigator.of(context).pop();
//                       if (taskList.isEmpty) {}
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // ==============================================To clear Textfield==========================================================

//   void clearField() {
//     titlecontroller.clear();
//     descriptioncontroller.clear();
//     datecontroller.clear();
//   }

//   //==============================================ShowModelBottomesheet in picture==============================================
//   //use optional parameter: is there bottomsheet for editing already added task or adding new task==============================

//   void _bottomsheetshower(bool addtask, [ModelClassTodo? todoObj]) {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       builder: (BuildContext context) {
//         return Padding(
//           padding: EdgeInsets.fromLTRB(
//             16.0, // Left padding
//             8.0, // Top padding
//             16.0, // Right padding
//             MediaQuery.of(context).viewInsets.bottom + 30.0,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(
//                 height: 5,
//               ),
//               addtask
//                   ? Text(
//                       "Create Task",
//                       style: GoogleFonts.quicksand(
//                           textStyle: const TextStyle(
//                               fontWeight: FontWeight.w600, fontSize: 25)),
//                     )
//                   : Text(
//                       "Edit Task",
//                       style: GoogleFonts.quicksand(
//                           textStyle: const TextStyle(
//                               fontWeight: FontWeight.w600, fontSize: 25)),
//                     ),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Text("Title",
//                         style:
//                             TextStyle(color: Color.fromRGBO(0, 139, 148, 1))),
//                     TextFormField(
//                       controller: titlecontroller,
//                       decoration: const InputDecoration(
//                           hintText: "Enter your task",
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Colors.black), // Change color as needed
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Color.fromRGBO(0, 139, 148, 1)),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(5)))),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please Enter your task";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Text("Description",
//                         style:
//                             TextStyle(color: Color.fromRGBO(0, 139, 148, 1))),
//                     TextFormField(
//                       controller: descriptioncontroller,
//                       maxLines: 3,
//                       decoration: const InputDecoration(
//                           hintText: "Enter task description...",
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Colors.black), // Change color as needed
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Color.fromRGBO(0, 139, 148, 1)),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(5)))),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please Enter your task description";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Text(
//                       "Date",
//                       style: TextStyle(color: Color.fromRGBO(0, 139, 148, 1)),
//                     ),
//                     TextFormField(
//                       readOnly: true,
//                       controller: datecontroller,
//                       onTap: () async {
//                         DateTime? datepicker = await showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime(2024),
//                             lastDate: DateTime(2025));
//                         String dateFormat =
//                             DateFormat.yMMMd().format(datepicker!);
//                         setState(() {
//                           datecontroller.text = dateFormat;
//                         });
//                       },
//                       decoration: const InputDecoration(
//                           hintText: "Choose date",
//                           suffixIcon: Icon(
//                             Icons.calendar_month_outlined,
//                             size: 30,
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Colors.black), // Change color as needed
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Color.fromRGBO(0, 139, 148, 1)),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(5)))),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please choose date";
//                         } else {
//                           return null;
//                         }
//                       },
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     bool allfieldfilled = _formKey.currentState!.validate();
//                     if (allfieldfilled) {
//                       addtask ? onSubmit(addtask) : onSubmit(addtask, todoObj);
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text("Succesfully Done..."),
//                         ),
//                       );
//                     }
//                     setState(() {});
//                   },
//                   style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(
//                             8.0), // Adjust the radius as needed
//                       ),
//                       backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
//                       fixedSize: const Size(330, 50)),
//                   child: addtask
//                       ? Text(
//                           "Submit",
//                           style: GoogleFonts.inter(
//                               textStyle: const TextStyle(
//                                   color: Color.fromRGBO(255, 255, 255, 1),
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 22)),
//                         )
//                       : Text(
//                           "Update",
//                           style: GoogleFonts.inter(
//                               textStyle: const TextStyle(
//                                   color: Color.fromRGBO(255, 255, 255, 1),
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 22)),
//                         ))
//             ],
//           ),
//         );
//       },
//     );
//   }

//   //====================================================buid method call=========================================================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shadowColor: Colors.grey,
//         elevation: 15,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
//         toolbarHeight: 150,
//         automaticallyImplyLeading: false,
//         // centerTitle: true,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Hello, ",
//               style: GoogleFonts.quicksand(
//                   textStyle: TextStyle(
//                       color: Colors.grey.shade200,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 30)),
//             ),
//             Text(
//               widget.uName,
//               style: GoogleFonts.notoSerif(
//                   textStyle: TextStyle(
//                       color: Colors.grey.shade200,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 40)),
//             ),
//             const SizedBox(height: 30),
//             Text(
//               "Lets, Plan your day!!! ",
//               style: GoogleFonts.lato(
//                   textStyle: TextStyle(
//                       color: Colors.grey.shade300,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 20)),
//             ),
//           ],
//         ),
//         backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
//       ),
//       body: taskList.isNotEmpty
//           ? Padding(
//               padding: const EdgeInsets.all(15),
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: taskList.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: const EdgeInsets.symmetric(vertical: 10),
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                           boxShadow: const [
//                             BoxShadow(
//                                 blurRadius: 8,
//                                 color: Color.fromRGBO(0, 0, 0, 0.1),
//                                 offset: Offset(0, 10))
//                           ],
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(10)),
//                           color: caardColors[index % 4]),
//                       child: Column(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             // mainAxisAlignment: ,
//                             children: [
//                               Container(
//                                 alignment: Alignment.center,
//                                 margin: const EdgeInsets.only(top: 15),
//                                 height: 52,
//                                 width: 52,
//                                 decoration: const BoxDecoration(
//                                     color: Colors.white,
//                                     shape: BoxShape.circle),
//                                 child: Image.asset("assets/images/img.png"),
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       taskList[index].title,
//                                       style: GoogleFonts.quicksand(
//                                           textStyle: const TextStyle(
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 15)),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(
//                                       taskList[index].description,
//                                       style: GoogleFonts.quicksand(
//                                           textStyle: const TextStyle(
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 12)),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 taskList[index].date,
//                                 style: GoogleFonts.quicksand(
//                                     textStyle: const TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 12)),
//                               ),
//                               const Spacer(
//                                 flex: 10,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   editingTask(taskList[index]);
//                                 },
//                                 child: const Icon(
//                                   Icons.edit_outlined,
//                                   size: 20,
//                                   color: Color.fromRGBO(0, 139, 148, 1),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     deleteTask(taskList[index]);
//                                   });
//                                 },
//                                 child: const Icon(Icons.delete_outline,
//                                     size: 20,
//                                     color: Color.fromRGBO(0, 139, 148, 1)),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     );
//                   }),
//             )
//           : Center(
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset("assets/images/noTaskpng.png"),
//                     Text(
//                       "No task available!!!",
//                       style: GoogleFonts.quicksand(
//                           textStyle: const TextStyle(
//                               fontWeight: FontWeight.w500, fontSize: 25)),
//                     ),
//                   ]),
//             ),
//       floatingActionButton: Row(
//         children: [
//           const SizedBox(
//             width: 35,
//           ),
//           FloatingActionButton(
//             shape: const CircleBorder(eccentricity: 0.1),
//             backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
//             onPressed: () {
//               setState(() {
//                 Navigator.pop(context);
//               });
//             },
//             child: const Icon(
//               Icons.logout,
//               color: Colors.white,
//             ),
//           ),
//           const Spacer(
//             flex: 6,
//           ),
//           FloatingActionButton(
//             shape: const CircleBorder(eccentricity: 0.1),
//             backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
//             onPressed: () {
//               setState(() {
//                 clearField();
//               });
//               _bottomsheetshower(true);
//             },
//             child: const Icon(
//               Icons.add,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/auth/login.dart';
import 'package:to_do_list/auth/register.dart';
// import 'package:to_do_list/practice2.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoAppV2 extends StatefulWidget {
  // final String uName;
  // const TodoAppV2({super.key, required this.uName});
  const TodoAppV2({super.key});
  @override
  State<TodoAppV2> createState() {
    return _TodoAppV2State();
  }
}

//========================================Model Class:To Store data in obj and pass to the list ==========================================

class ModelClassTodo {
  String title;
  String description;
  String date;
  ModelClassTodo(
      {required this.title, required this.description, required this.date});
}

class _TodoAppV2State extends State<TodoAppV2> {
  //=========================TextEditingController :To store data from textfields=======================================================
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ======================================colorList====================================================================================
  List<Color> caardColors = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];
  // ==========================================Empty List to store data in obj form=========================================================
  List taskList = [];

  //=========================================Submit function by a conditions==============================================================
  //Use Optional parameter: useful for satisfying requirement as of is there submit button for adding new task or editing already added task
  void onSubmit(bool addTask, [ModelClassTodo? todoObj]) {
    if (titlecontroller.text.trim().isNotEmpty &&
        descriptioncontroller.text.trim().isNotEmpty &&
        datecontroller.text.trim().isNotEmpty) {
      if (addTask) {
        setState(() {
          taskList.add(
            ModelClassTodo(
                title: titlecontroller.text.trim(),
                description: descriptioncontroller.text.trim(),
                date: datecontroller.text.trim()),
          );
        });
      } else {
        setState(() {
          todoObj!.title = titlecontroller.text.trim();
          todoObj.description = descriptioncontroller.text.trim();
          todoObj.date = datecontroller.text.trim();
        });
      }
      clearField();

      Navigator.of(context).pop();
    }
  }

  //=========================================To edit task=========================================================================

  void editingTask(ModelClassTodo todoObj) {
    titlecontroller.text = todoObj.title;
    descriptioncontroller.text = todoObj.description;
    datecontroller.text = todoObj.date;
    _bottomsheetshower(false, todoObj);
  }

  //==========================================To delete obj directly from a list===================================================

  void deleteTask(ModelClassTodo todoObj) {
    _showMyDialog(todoObj);
  }

  // =========================================Dialouge box for confirmation of delete task==========================================

  Future<void> _showMyDialog(ModelClassTodo todoObj) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm to delete'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure want to delete this Task?'),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 139, 148, 1)),
                  child:
                      const Text('No', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (taskList.isEmpty) {
                      setState(() {});
                    }
                  },
                ),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 139, 148, 1)),
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      taskList.remove(todoObj);
                      Navigator.of(context).pop();
                      if (taskList.isEmpty) {}
                    });
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  // ==============================================To clear Textfield==========================================================

  void clearField() {
    titlecontroller.clear();
    descriptioncontroller.clear();
    datecontroller.clear();
  }

  //==============================================ShowModelBottomesheet in picture==============================================
  //use optional parameter: is there bottomsheet for editing already added task or adding new task==============================

  void _bottomsheetshower(bool addtask, [ModelClassTodo? todoObj]) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            16.0, // Left padding
            8.0, // Top padding
            16.0, // Right padding
            MediaQuery.of(context).viewInsets.bottom + 30.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
              addtask
                  ? Text(
                      "Create Task",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 25)),
                    )
                  : Text(
                      "Edit Task",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 25)),
                    ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Title",
                        style:
                            TextStyle(color: Color.fromRGBO(0, 139, 148, 1))),
                    TextFormField(
                      controller: titlecontroller,
                      decoration: const InputDecoration(
                          hintText: "Enter your task",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black), // Change color as needed
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(111, 81, 255, 1)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter your task";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Description",
                        style:
                            TextStyle(color: Color.fromRGBO(111, 81, 255, 1))),
                    TextFormField(
                      controller: descriptioncontroller,
                      maxLines: 3,
                      decoration: const InputDecoration(
                          hintText: "Enter task description...",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black), // Change color as needed
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(111, 81, 255, 1)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter your task description";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Date",
                      style: TextStyle(color: Color.fromRGBO(111, 81, 255, 1)),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: datecontroller,
                      onTap: () async {
                        DateTime? datepicker = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2024),
                            lastDate: DateTime(2025));
                        String dateFormat =
                            DateFormat.yMMMd().format(datepicker!);
                        setState(() {
                          datecontroller.text = dateFormat;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: "Choose date",
                          suffixIcon: Icon(
                            Icons.calendar_month_outlined,
                            size: 30,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black), // Change color as needed
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(111, 81, 255, 1)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please choose date";
                        } else {
                          return null;
                        }
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    bool allfieldfilled = _formKey.currentState!.validate();
                    if (allfieldfilled) {
                      addtask ? onSubmit(addtask) : onSubmit(addtask, todoObj);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Succesfully Done..."),
                        ),
                      );
                    }
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the radius as needed
                      ),
                      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
                      fixedSize: const Size(330, 50)),
                  child: addtask
                      ? Text(
                          "Submit",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22)),
                        )
                      : Text(
                          "Update",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22)),
                        ))
            ],
          ),
        );
      },
    );
  }

  //====================================================buid method call=========================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good morning",
                style: GoogleFonts.quicksand(
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Text(
                "Harshal",
                style: GoogleFonts.quicksand(
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  "CREATE TO DO LIST",
                  style: GoogleFonts.quicksand(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: Container(
                    // height: 535,
                    // height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.only(top: 15),
                    // padding: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: ListView.builder(
                        // shrinkWrap: true,
                        itemCount: taskList.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            endActionPane: ActionPane(
                                extentRatio: 0.2,
                                motion: const ScrollMotion(),
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(15),
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            editingTask(taskList[index]);
                                          },
                                          child: Container(
                                            height: 31,
                                            width: 31,
                                            decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    111, 81, 255, 1),
                                                shape: BoxShape.circle),
                                            child: const Icon(
                                              Icons.edit,
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            deleteTask(taskList[index]);
                                          },
                                          child: Container(
                                            height: 31,
                                            width: 31,
                                            decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    111, 81, 255, 1),
                                                shape: BoxShape.circle),
                                            child: const Icon(
                                              Icons.delete,
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.08),
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      offset: Offset(0, 10))
                                ],
                              ),
                              child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          height: 52,
                                          width: 52,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromRGBO(
                                                217, 217, 217, 1),
                                          ),
                                          child: Image.asset(
                                              "assets/images/img1.png"),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                taskList[index].title,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      taskList[index]
                                                          .description,
                                                      style: const TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.check_circle,
                                                    color: Colors.green,
                                                    size: 20,
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                taskList[index].date,
                                                style: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ]),
                              // height: 100,
                              // width: 200,
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
        shape: const CircleBorder(eccentricity: 1),
        onPressed: () {
          _bottomsheetshower(true);
        },
        child: const Icon(
          Icons.add,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
