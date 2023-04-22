import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project/auth_page/1_login_page/text_feild/sign_in_button.dart';
import 'package:my_project/auth_page/1_login_page/text_feild/text_feild.dart';
import 'package:my_project/auth_page/forget_password/forgot_password.dart';
import 'package:my_project/auth_page/root_page/root_page.dart';

import '../../DialogBox/errorDialog.dart';
import '../../home_page.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginScreen({
    Key? key,
    required this.showRegisterPage,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailEditingController = TextEditingController();
  var passwordEditingController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  loginAccount() {
    User? currentUser;

    auth
        .signInWithEmailAndPassword(
            email: emailEditingController.text,
            password: passwordEditingController.text)
        .then((value) {
      currentUser = value.user;

      Route newRoute = MaterialPageRoute(builder: (context) => MainPages());
      Navigator.pushReplacement(context, newRoute);
    }).catchError((error) {
      showDialog(
          context: context,
          builder: (_) {
            return ErrorDialog(
              message: "Failed " + error.toString(),
              Key: null,
            );
          });
    });

    if (auth.currentUser != null) {
      getUserInfo(currentUser!.uid);
    }
  }

  getUserInfo(String uid) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .get()
        .then((results) {
      String status = results.data()!["status"];

      if (status == "approved") {
        Route newRoute = MaterialPageRoute(builder: (context) => HomePage());
        Navigator.pushReplacement(context, newRoute);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ErrorDialog(
                message: "You are blocked by the Admin",
                Key: null,
              );
            });
        auth.signOut();
        Route newRoute = MaterialPageRoute(builder: (context) => HomePage());
        Navigator.pushReplacement(context, newRoute);
      }
    });
  }

  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  // sign user in method
  // void signUserIn() async {
  //   // show loading circle
  //
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     },
  //   );
  //
  //   // try sign in
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //     // pop the loading circle
  //     Navigator.pop(context);
  //   } on FirebaseAuthException catch (e) {
  //     // pop the loading circle
  //     Navigator.pop(context);
  //     // WRONG EMAIL
  //     if (e.code == 'user-not-found') {
  //       // show error to user
  //       wrongEmailMessage();
  //     }
  //
  //     // WRONG PASSWORD
  //     else if (e.code == 'wrong-password') {
  //       // show error to user
  //       wrongPasswordMessage();
  //     }
  //   }
  // }

  // wrong email message popup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blue,
          Colors.red,
        ],
      )),
      child: Scaffold(
               body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 410),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(),
                    height: 550,
                    width: 300,

                    child: Column(
                      children: [
                        const Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // text feild one
                        MyTextField(
                          controller: emailEditingController,

                          hintText: 'enter your gmail',
                          obscureText: false,
                          icons: Icon(
                            Icons.mail_sharp,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        //text feild two
                        MyTextField(
                          controller: passwordEditingController,
                          hintText: 'enter your password',
                          obscureText: true,
                          icons: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),

                        ),
                        const SizedBox(
                          height: 20,
                        ),
// forget password
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 1),
                              child: Text(
                                "If you dont have account click to ",
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            GestureDetector(
                              child: InkWell(
                                onTap: widget.showRegisterPage,
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        MyButton(
                          onTap: loginAccount,
                          text: 'Sign In',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 140),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPassword()),
                              );
                            },
                            child: const Text(
                              "Forgot password",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
