import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth_page/root_page/root_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDlCvaZVP6vmXrwZ__FQzy7h6Fis8zRQ20',
    appId: '1:512458523126:android:95974b3f64b0de5bd887d7',
    messagingSenderId: '512458523126',
    projectId: 'our-first-project-44556',
    storageBucket: 'our-first-project-44556.appspot.com',
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: MainPages(),
    );
  }
}
