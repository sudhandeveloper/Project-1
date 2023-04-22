import 'package:flutter/material.dart';

import '../all_screens/Materiles_page/Materile.dart';
import '../feed_list/Materiles_list.dart';

class PostFeed extends StatefulWidget {
  const PostFeed({Key? key}) : super(key: key);

  @override
  State<PostFeed> createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => Materiles()),
            );
          },
          child: const BackButton(
            color: Colors.black,
          ),
        ),
      ),
      body: MaterilesList(),
    ));
  }
}
