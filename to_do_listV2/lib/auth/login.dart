import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/ToDoAppV2.dart';
import 'package:to_do_list/auth/register.dart';

class Login extends StatefulWidget {
  final List<UserDataclass> dataList;
  const Login({super.key, required this.dataList});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _loginemailcontroller = TextEditingController();
  final TextEditingController _loginpasswordcontroller =
      TextEditingController();
  final GlobalKey<FormState> _loggloKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset("assets/images/login.png"),
            Text(
              "Login Here",
              style: GoogleFonts.quicksand(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: _loggloKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _loginemailcontroller,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 139, 148, 1))),
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            labelStyle: TextStyle(
                                // fontStyle: FontStyle.italic,
                                color: Color.fromRGBO(0, 139, 148, 1)),
                            labelText: "Enter your email"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter your email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        maxLength: 8,
                        obscureText: true,
                        obscuringCharacter: "*",
                        controller: _loginpasswordcontroller,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 139, 148, 1))),
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            labelStyle: TextStyle(
                                // fontStyle: FontStyle.italic,
                                color: Color.fromRGBO(0, 139, 148, 1)),
                            labelText: "Enter your password"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter your password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(200, 40),
                              backgroundColor:
                                  const Color.fromRGBO(0, 139, 148, 1)),
                          onPressed: () {
                            bool logAllFilled =
                                _loggloKey.currentState!.validate();

                            if (logAllFilled) {
                              for (UserDataclass obj in widget.dataList) {
                                if (_loginemailcontroller.text == obj.email &&
                                    _loginpasswordcontroller.text ==
                                        obj.password) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Login Successful..."),
                                    ),
                                  );
                                  _loginemailcontroller.clear();
                                  _loginpasswordcontroller.clear();
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => ToDoAppV1(
                                  //               uName: obj.name,
                                  //             )));
                                  break;
                                }
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Invalid Credentials..."),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't hava an account ?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Register()));
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 139, 148, 1)),
                              ))
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
