import 'package:flutter/material.dart';
import 'package:my_project/all_screens/properties/properties.dart';
import 'package:my_project/feed_list/property_list.dart';

import '../all_screens/Materiles_page/Materile.dart';
import '../feed_list/Materiles_list.dart';

class postPropertiesFeed extends StatefulWidget {
  const postPropertiesFeed({Key? key}) : super(key: key);

  @override
  State<postPropertiesFeed> createState() => _postPropertiesFeedState();
}

class _postPropertiesFeedState extends State<postPropertiesFeed> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => Properties()),
            );
          },
          child: const BackButton(
            color: Colors.black,
          ),
        ),
      ),
      body: PropertiesList(),
    ));
  }
}
