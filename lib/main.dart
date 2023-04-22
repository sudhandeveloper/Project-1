import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth_page/root_page/root_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "",
    appId: '',
    messagingSenderId: "",
    projectId: "",
    storageBucket: "",
  ));
  runApp(MyApp());
}

//removed back end connection by developer

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
