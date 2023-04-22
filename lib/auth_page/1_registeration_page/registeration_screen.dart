import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project/auth_page/1_login_page/text_feild/sign_in_button.dart';
import 'package:my_project/globalvariables.dart';
import 'package:my_project/home_page.dart';
import '../../DialogBox/errorDialog.dart';
import '../1_login_page/text_feild/text_feild.dart';

class RegisterationScreen extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterationScreen({Key? key, required this.showLoginPage,}) : super(key: key);

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  var nameEditingController=TextEditingController();
  var phoneEditingController=TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();



  FirebaseAuth auth=FirebaseAuth.instance;
  registerUser()async{

    User currentUser;

    auth.createUserWithEmailAndPassword(email: emailEditingController.text, password: passwordEditingController.text)
        .then((value) {

      currentUser=value.user!;
      userId=currentUser.uid;
      userEmail=currentUser.email!;
      getUserName=nameEditingController.text.trim();

      uploadDataToFirebaseDatabase();

      Route newRoute=MaterialPageRoute(builder: (context)=>const HomePage());
      Navigator.pushReplacement(context, newRoute);

    }).catchError((error){

      showDialog(context: context,
          builder: (_){
            return ErrorDialog(message: "Failed   "+error.toString(), Key: null,);
          }
      );
    });

    if(auth.currentUser!=null){

      Route newRoute=MaterialPageRoute(builder: (context)=>const HomePage());
      Navigator.pushReplacement(context, newRoute);
    }
  }

  uploadDataToFirebaseDatabase(){

    Map<String,dynamic>userData={

      "userEmail":emailEditingController.text.trim(),
      "uid":userId,
      "phone":phoneEditingController.text.trim(),
      "userName":nameEditingController.text.trim(),
      "status":"approved"

    };

    FirebaseFirestore.instance.collection(" Users").doc(userId).set(userData);


  }


//
// bool passwordConfirmed(){
//     if(passwordController.text.trim()==confirmpasswordController.text.trim()){
//       return true;
//     }else {
//       return false;
//     }
// }
//   void signUserUp() async {
//     // show loading circle
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//
//     // try sign up
//     try {
//      if(passwordConfirmed()){ await FirebaseAuth.instance.createUserWithEmailAndPassword(
//        email: emailController.text.trim(),
//        password: passwordController.text.trim(),
//      );}
//       // pop the loading circle
//       Navigator.pop(context);
//     } on FirebaseAuthException catch (e) {
//       // pop the loading circle
//       Navigator.pop(context);
//       // WRONG EMAIL
//       if (e.code == 'user-not-found') {
//         // show error to user
//         wrongEmailMessage();
//       }
//
//       // WRONG PASSWORD
//       else if (e.code == 'wrong-password') {
//         // show error to user
//         wrongPasswordMessage();
//       }
//     }
//   }

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
              style: TextStyle(color: Colors.grey),
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
              style: TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
       
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(
              top: 300,
            ),
            child: Center(
              child: Container(
                decoration: const BoxDecoration(),
                height: 750,
                width: 300,
                child: Column(
                  children: [
                    const Text(
                      "REGISTERATION",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // text feild one
                     MyTextField(
                      controller: nameEditingController,
                      hintText: 'Name',
                      obscureText: false,
                      icons: Icon(Icons.account_circle_sharp),
                    ),
                    const SizedBox(
                      height: 15,
                    ), MyTextField(
                      controller: phoneEditingController,
                      hintText: ' Phone number',
                      obscureText: false,
                      icons: Icon(Icons.lock),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                     MyTextField(
                      controller:emailEditingController,
                      hintText: 'email',
                      obscureText: false,
                      icons: Icon(Icons.email_outlined),
                    ),
                    const SizedBox(
                      height: 15,
                    ),  MyTextField(
                      controller:passwordEditingController,
                      hintText: 'password',
                      obscureText: false,
                      icons: Icon(Icons.email_outlined),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //text feild two
// forget password
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 1),
                          child: Text(
                            "If you have account already click to move",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        GestureDetector(
                          child: InkWell(
                            onTap:widget.showLoginPage,
                            child: const Text(
                              "BACK",
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
                    InkWell(
                      child: MyButton(
                        onTap:   registerUser,
                        text: 'Register',

                      ),
                    )
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
