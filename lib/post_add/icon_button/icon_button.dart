import 'package:flutter/material.dart';

class Catagory extends StatelessWidget {
  final Function()? onTap;
  const Catagory(
      {Key? key,
      required this.title,
      required this.icon,
      required this.warna,
      this.onTap})
      : super(key: key);
  final String title;
  final IconData icon;
  final MaterialColor warna;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 10,
        child: InkWell(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Icon(
                    icon,
                    size: 70.0,
                    color: warna,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
