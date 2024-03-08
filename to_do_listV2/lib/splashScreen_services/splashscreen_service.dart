import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_list/ToDoAppV2.dart';
import 'package:to_do_list/auth/register.dart';

class SplashServices {
  void isEnter(BuildContext context) {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Register())));
  }
}
