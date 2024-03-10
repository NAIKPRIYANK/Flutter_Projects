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
  database = openDatabase(
    join(await getDatabasesPath(), "TodoApp.db"),
    version: 1,
    onCreate: (db, version) {
      db.execute('''CREATE TABLE TodoApp(
        title TEXT PRIMARY KEY,
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

Future insertData(ModelClassTodo obj) async {
  final db = await database;
  db.insert("TodoApp", obj.getMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future getData() async {
  final db = await database;
  List<Map<String, dynamic>> dataList = await db.query("TodoApp");
  return List.generate(dataList.length, (index) {
    return ModelClassTodo(
        title: dataList[index]['title'],
        description: dataList[index]['description'],
        date: dataList[index]['date']);
  });
}

Future deleteTasks(String title) async {
  final db = await database;
  await db.delete("TodoApp", where: 'title=?', whereArgs: [title]);
}

Future taskUpdate(ModelClassTodo obj) async {
  final db = await database;
  await db.update(
    "TodoApp",
    obj.getMap(),
    where:'title=?',
    whereArgs:[obj.title]
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // home: SplashScreen(),
        // home: ToDoAppV1(uName: "Priyank")
        // home: Register(),
        );
  }
}
