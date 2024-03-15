import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_tech_dairy/auth/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usercontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Sign Up!",
                  style: TextStyle(
                      fontSize: 40.33,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 20, left: 40, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email",
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
                                Icons.email,
                                color: Color.fromRGBO(164, 164, 164, 1),
                              ),
                              hintText: "Email",
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
                                Icons.person_2_outlined,
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
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Already have account?",
                            style: TextStyle(
                                color: Color.fromRGBO(164, 164, 164, 1)),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Color.fromRGBO(164, 164, 164, 1),
                                    fontWeight: FontWeight.w800),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
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
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
