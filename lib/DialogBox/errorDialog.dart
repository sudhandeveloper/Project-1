import 'package:flutter/material.dart';
import 'package:my_project/auth_page/1_login_page/login_screen.dart';
import 'package:my_project/auth_page/root_page/root_page.dart';

class ErrorDialog extends StatelessWidget {
  final String message;

  const ErrorDialog({required Key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPages())),
          child: Center(child: Text("Ok")),
        )
      ],
    );
  }
}
