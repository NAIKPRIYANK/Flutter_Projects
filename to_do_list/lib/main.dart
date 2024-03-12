import 'package:flutter/material.dart';
import 'package:to_do_list/ToDoAppV1.dart';
import 'package:to_do_list/auth/register.dart';
// import 'package:to_do_list/ToDoAppV1.dart';
import 'package:to_do_list/splash_screen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// import 'package:to_do_list/practice2.dart';
dynamic database;
List<ModelClassTodo> taskDataList = [];
bool emptyList = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //=====================================Configuration for databaase=======================================
  database = openDatabase(
    join(await getDatabasesPath(), "TodoAppV1.db"),
    version: 1,
    onCreate: (db, version) {
      // db.execute('''CREATE TABLE TodoApp(
      db.execute('''CREATE TABLE TodoList(
        taskid INTEGER PRIMARY KEY,
        title TEXT ,
        description TEXT ,
        date TEXT
      )
''');
    },
  );
  taskDataList = await getData();
  if (taskDataList.isNotEmpty) {
    emptyList = false;
  }
  runApp(const MyApp());
}


// ===================inserting Data into SQFlite====================================================

Future insertData(ModelClassTodo obj) async {
  final db = await database;
  await db.insert("TodoList", obj.getMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}



// ===================getting data from SQFlite========================================================

Future getData() async {
  final db = await database;
  List<Map<String, dynamic>> dataList = await db.query("TodoList");
  return List.generate(dataList.length, (index) {
    return ModelClassTodo(
        taskid: dataList[index]['taskid'],
        title: dataList[index]['title'],
        description: dataList[index]['description'],
        date: dataList[index]['date']);
  });
}



// ====================deleting data from SQFlite========================================================

Future deleteTasks(int? taskid) async {
  final db = await database;
  await db.delete("TodoList", where: 'taskid=?', whereArgs: [taskid]);
}


// ======================Updating data from SQFlite======================================================

Future taskUpdate(ModelClassTodo obj) async {
  final db = await database;
  await db.update("TodoList", obj.getMap(),
      where: 'taskid=?', whereArgs: [obj.taskid]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: ToDoAppV1(uName: "Priyank"),
      // home: Register(),
    );
  }
}
