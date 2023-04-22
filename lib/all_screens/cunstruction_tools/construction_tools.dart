import 'package:flutter/material.dart';
import 'package:my_project/information_screens/Construction_tools_details.dart';

import '../../post_feed/Cunstruction_tools_feed.dart';

class CunstructionTools extends StatefulWidget {
  const CunstructionTools({Key? key}) : super(key: key);

  @override
  State<CunstructionTools> createState() => _CunstructionToolsState();
}

class _CunstructionToolsState extends State<CunstructionTools> {
  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Container(
        height: MediaQuery.of(context).size.height * 1 / 1,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
                  height: 350,
                  width: 330,
                  child: Card(
                    color: Colors.white,
                    shadowColor: Colors.black,
                    elevation: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 150,
                          width: 500,
                          child: Card(
                            elevation: 20,
                            child: Card(
                              child: Image(
                                image: AssetImage(
                                  "assets/images/52483.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            "Information is Wealth!!s",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          ),
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 4,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, top: 2),
                          child: Text(
                            "Tools  ",
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
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Construction_tools_details()),
                                  );},
                                icon: Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.purpleAccent,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 340,
                width: 340,
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
                                  "assets/images/362737.jpg",
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
                              onPressed: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CunstructionToolsFeed()),
                                );
                              },
                              icon: const Icon(
                                Icons.arrow_forward_sharp,
                                color: Colors.purpleAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
