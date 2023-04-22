import 'package:flutter/material.dart';
import 'package:my_project/feed_list/property_list.dart';

import '../all_screens/Materiles_page/Materile.dart';
import '../feed_list/Materiles_list.dart';
import '../feed_list/contractor_list.dart';

class PostContractorsFeed extends StatefulWidget {
  const PostContractorsFeed({Key? key}) : super(key: key);

  @override
  State<PostContractorsFeed> createState() => _PostContractorsFeedState();
}

class _PostContractorsFeedState extends State<PostContractorsFeed> {
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
      body: ContractorsList(),
    ));
  }
}
