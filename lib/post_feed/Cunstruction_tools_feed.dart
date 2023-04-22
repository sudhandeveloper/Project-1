import 'package:flutter/material.dart';
import 'package:my_project/feed_list/cunstruction_list.dart';

import '../all_screens/Materiles_page/Materile.dart';

class CunstructionToolsFeed extends StatefulWidget {
  const CunstructionToolsFeed({Key? key}) : super(key: key);

  @override
  State<CunstructionToolsFeed> createState() => _CunstructionToolsFeedState();
}

class _CunstructionToolsFeedState extends State<CunstructionToolsFeed> {
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
      body: CunstructionToolsList(),
    ));
  }
}
