import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/main.dart';

class ToDoAppV1 extends StatefulWidget {
  final String uName;
  const ToDoAppV1({super.key, required this.uName});
  @override
  State<ToDoAppV1> createState() {
    return _ToDoAppV1State();
  }
}

//========================================Model Class:To Store data in obj and pass to the list ==========================================

class ModelClassTodo {
  
  String title;
  String description;
  String date;
  ModelClassTodo(
      {required this.title, required this.description, required this.date});

  Map<String, String> getMap() {
    return {
      'title': title,
      'description': description,
      'date': date,
    };
  }
}

class _ToDoAppV1State extends State<ToDoAppV1> {
  //=========================TextEditingController :To store data from textfields=======================================================
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ======================================colorList====================================================================================
  List<Color> caardColors = [
    const Color.fromARGB(255, 227, 235, 255),
    const Color.fromARGB(255, 255, 254, 227),
    const Color.fromARGB(255, 255, 232, 255),
    const Color.fromARGB(255, 255, 230, 230),
  ];
  // ==========================================Empty List to store data in obj form=========================================================
  List taskList = taskDataList;

  //=========================================Submit function by a conditions==============================================================
  //Use Optional parameter: useful for satisfying requirement as of is there submit button for adding new task or editing already added task
  void onSubmit(bool addTask, [ModelClassTodo? todoObj]) async {
    if (titlecontroller.text.trim().isNotEmpty &&
        descriptioncontroller.text.trim().isNotEmpty &&
        datecontroller.text.trim().isNotEmpty) {
      ModelClassTodo obj = ModelClassTodo(
          title: titlecontroller.text.trim(),
          description: descriptioncontroller.text.trim(),
          date: datecontroller.text.trim());
      if (addTask) {
        await insertData(obj);
        taskList = await getData();
        setState(() {
          if (taskList.isNotEmpty) {
            emptyList = false;
          }
        });
      } else {
        obj = ModelClassTodo(
            title: titlecontroller.text,
            description: descriptioncontroller.text,
            date: datecontroller.text);
        await taskUpdate(obj);
        taskList = await getData();
        setState(() {
          // todoObj!.title = titlecontroller.text.trim();
          // todoObj.description = descriptioncontroller.text.trim();
          // todoObj.date = datecontroller.text.trim();
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

  void deleteTask(ModelClassTodo todoObj) async {
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
                      setState(() {
                        emptyList = true;
                      });
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
                  onPressed: () async {
                    await deleteTasks(todoObj.title);
                    taskList = await getData();

                    setState(() {
                      Navigator.of(context).pop();
                      if (taskList.isEmpty) {
                        emptyList = true;
                      }
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

  // bool flag = false;
  // Icon taskChecker(bool flag) {
  //   if (!flag) {
  //     return const Icon(
  //       Icons.pending_actions,
  //       size: 40,
  //       color: Color.fromRGBO(0, 139, 148, 1),
  //     );
  //   } else {
  //     return const Icon(Icons.task_alt_outlined,
  //         size: 40, color: Color.fromRGBO(0, 139, 148, 1));
  //   }
  // }

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
                                  color: Color.fromRGBO(0, 139, 148, 1)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
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
                            TextStyle(color: Color.fromRGBO(0, 139, 148, 1))),
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
                                  color: Color.fromRGBO(0, 139, 148, 1)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
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
                      style: TextStyle(color: Color.fromRGBO(0, 139, 148, 1)),
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
                                  color: Color.fromRGBO(0, 139, 148, 1)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
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
                            15), // Adjust the radius as needed
                      ),
                      backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
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
    print("$taskList///////////////////////////////////////////////");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.logout,
                      color: Color.fromRGBO(0, 139, 148, 1),
                    )),
              ),
              const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          )
        ],
        shadowColor: Colors.grey,
        // elevation: 15,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        // centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Hello, ",
              style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 30)),
            ),
            Text(
              "${widget.uName.toUpperCase().trim()}!",
              style: GoogleFonts.notoSerif(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 40)),
            ),
            const SizedBox(height: 30),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 1, 172, 181),
      ),
      body: !emptyList
          ? Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                height: 800,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: taskList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 8,
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    offset: Offset(0, 10))
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: caardColors[index % 4],
                              // color: Color.fromARGB(255, 255, 255, 255)
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisAlignment: ,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(top: 15),
                                      height: 52,
                                      width: 52,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.blur_circular_rounded,
                                        size: 40,
                                        color: Color.fromRGBO(0, 139, 148, 1),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            taskList[index].title,
                                            style: GoogleFonts.quicksand(
                                                textStyle: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 15)),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            taskList[index].description,
                                            style: GoogleFonts.quicksand(
                                                textStyle: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12)),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      taskList[index].date,
                                      style: GoogleFonts.quicksand(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                    ),
                                    const Spacer(
                                      flex: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        editingTask(taskList[index]);
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        height: 35,
                                        width: 35,
                                        child: const Icon(
                                          Icons.edit_outlined,
                                          size: 20,
                                          color: Color.fromRGBO(0, 139, 148, 1),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          deleteTask(taskList[index]);
                                        });
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        height: 35,
                                        width: 35,
                                        child: const Icon(Icons.delete_outline,
                                            size: 20,
                                            color:
                                                Color.fromRGBO(0, 139, 148, 1)),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            )
          : Center(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                // height: 800,
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/noTaskpng.png",
                        height: 170,
                        width: 400,
                      ),
                      Text(
                        "No task available!!!",
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 25)),
                      ),
                    ]),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(eccentricity: 0.1),
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
        onPressed: () {
          setState(() {
            clearField();
          });
          _bottomsheetshower(true);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
