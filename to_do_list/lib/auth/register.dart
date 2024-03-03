import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/auth/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class UserDataclass {
  String name;
  String email;
  String password;
  UserDataclass(
      {required this.name, required this.email, required this.password});
}

class _RegisterState extends State<Register> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _gloKey = GlobalKey<FormState>();
  List<UserDataclass> allUsersList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset("assets/images/signin.png"),
            Text(
              "Register Here",
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
                  key: _gloKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _namecontroller,
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 139, 148, 1))),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            labelStyle: TextStyle(
                                // fontStyle: FontStyle.italic,
                                color: Color.fromRGBO(0, 139, 148, 1)),
                            labelText: "Enter your name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter your name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailcontroller,
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
                        controller: _passwordcontroller,
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
                            return "Please create your password";
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
                            bool regallfieldfilled =
                                _gloKey.currentState!.validate();
                            if (regallfieldfilled) {
                              allUsersList.add(UserDataclass(
                                  name: _namecontroller.text,
                                  email: _emailcontroller.text,
                                  password: _passwordcontroller.text));

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Registration Successful..."),
                              ));
                              _namecontroller.clear();
                              _emailcontroller.clear();
                              _passwordcontroller.clear();
                              // setState(() {
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>  Login(dataList:allUsersList)));
                              //   });
                            }
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Login(dataList: allUsersList)));
                                });
                              },
                              child: const Text(
                                "Login",
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
