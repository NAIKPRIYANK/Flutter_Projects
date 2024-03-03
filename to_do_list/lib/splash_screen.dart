import 'package:flutter/material.dart';
// import 'package:splashscreen/firebase_services/splash_services.dart';

import 'package:to_do_list/splashScreen_services/splashscreen_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    super.initState();
    splashScreen.isEnter(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/spsc.png"),
            Image.asset("assets/images/todo.png")
          ],
        ),
      ),
    );
  }
}
