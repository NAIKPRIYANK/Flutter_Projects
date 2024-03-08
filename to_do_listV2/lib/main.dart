import 'package:flutter/material.dart';
import 'package:to_do_list/ToDoAppV2.dart';
import 'package:to_do_list/auth/register.dart';
// import 'package:to_do_list/ToDoAppV1.dart';
import 'package:to_do_list/splash_screen.dart';

// import 'package:to_do_list/practice2.dart';

void main() {
  runApp(const MyApp());
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
      home: TodoAppV2(),
      // home: Register(),
    );
  }
}
