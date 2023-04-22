import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project/auth_page/1_login_page/login_screen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late String email;
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen(
                                showRegisterPage: () {},
                              )),
                    );
                  },
                  icon: const Icon(
                    Icons.chevron_left_rounded,
                    size: 50,
                    color: Colors.black,
                  )),
              const SizedBox(
                width: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 17, left: 20),
                child: Text(
                  "FORGET PASSWORD",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Center(
              child: Container(
                height: 200,
                width: 400,
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        "Pleas enter the email we will send you password reset link",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 100,
                      width: 400,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 70,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade200,
                    borderRadius: BorderRadius.circular(13)),
                child: Center(
                  child: Text(
                    "Rest Password",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
