import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_tech_dairy/auth/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usercontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
      body: Stack(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/toplefmocs.png",
            ),
            Expanded(
              child: Image.asset(
                "assets/images/toprigmocs.png",
                fit: BoxFit.cover,
                height: 300,
                width: 800,
              ),
            ),
          ],
        ),
        Positioned.fill(
          bottom: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/images/bottom.png",
              height: 310,
              width: 400,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Welcome Back!",
                  style: TextStyle(
                      fontSize: 40.33,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const Text(
                  "welcome back we missed you",
                  style: TextStyle(
                      fontSize: 14.33,
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40, bottom: 20, left: 40, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Username",
                        style:
                            TextStyle(color: Color.fromRGBO(164, 164, 164, 1)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(54, 36, 73, 1),
                                  Color.fromRGBO(33, 17, 52, 1)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [0.5, 0.8])),
                        child: TextFormField(
                          controller: _usercontroller,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle_outlined,
                                color: Color.fromRGBO(164, 164, 164, 1),
                              ),
                              hintText: "Username",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(164, 164, 164, 1)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Password",
                          style: TextStyle(
                              color: Color.fromRGBO(164, 164, 164, 1))),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(54, 36, 73, 1),
                                  Color.fromRGBO(33, 17, 52, 1)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [0.5, 0.8])),
                        child: TextFormField(
                          controller: _passwordcontroller,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.key,
                                color: Color.fromRGBO(164, 164, 164, 1),
                              ),
                              suffixIcon: Icon(
                                Icons.remove_red_eye_rounded,
                                color: Color.fromRGBO(164, 164, 164, 1),
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(164, 164, 164, 1)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                                color: Color.fromRGBO(164, 164, 164, 1)),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Register()));
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Color.fromRGBO(164, 164, 164, 1),fontWeight: FontWeight.w700),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    width: 314,
                    height: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(156, 63, 228, 1),
                              Color.fromRGBO(198, 86, 71, 1)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [0.1, 0.9])),
                    child: const Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
