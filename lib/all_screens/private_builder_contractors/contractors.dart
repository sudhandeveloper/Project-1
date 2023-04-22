import 'package:flutter/material.dart';

import '../../post_feed/Cunstruction_tools_feed.dart';
import '../../post_feed/contractors_feeds.dart';

class Contractors extends StatefulWidget {
  const Contractors({Key? key}) : super(key: key);

  @override
  State<Contractors> createState() => _ContractorsState();
}

class _ContractorsState extends State<Contractors> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 300,
                  width: 470,
                  child: Card(
                    elevation: 20,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: SizedBox(
                            height: 50,
                            width: 200,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 20,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20, top: 7),
                                child: Text(
                                  'ARTICLES',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: SizedBox(
                            height: 160,
                            width: 430,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 20,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20, top: 7),
                                    child: Text(
                                      '20 Types of Contractors in Construction',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 18, top: 2),
                                        child: Text(
                                          "Lest move  ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.arrow_forward_sharp,
                                          color: Colors.purpleAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 340,
              width: 440,
              child: Card(
                  elevation: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 150,
                        width: 500,
                        child: Card(
                          elevation: 30,
                          child: Card(
                            shadowColor: Colors.black,
                            child: Image(
                              image: AssetImage(
                                "assets/images/th (1).jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 2),
                        child: Text(
                          "Shopping Starts ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Find your Needs",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 2),
                            child: Text(
                              "Lest move  ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostContractorsFeed()),
                            );},
                            icon: const Icon(
                              Icons.arrow_forward_sharp,
                              color: Colors.purpleAccent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
