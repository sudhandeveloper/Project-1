import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  State<HeaderDrawer> createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  void signUserOut() {
    Navigator.pop(context);
    FirebaseAuth.instance.signOut();
  }
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Column(
        children: [
          Container(
            decoration:
                const BoxDecoration(color: Colors.blueAccent, boxShadow: [
              BoxShadow(
                offset: Offset(0.0, 5),
                color: Colors.black,
                blurRadius: 5,
              ),
            ]),
            height: 200,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.email!,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: signUserOut,
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
