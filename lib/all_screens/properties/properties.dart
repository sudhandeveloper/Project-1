import 'package:flutter/material.dart';
import 'package:my_project/post_feed/properties_feed.dart';

class Properties extends StatefulWidget {
  const Properties({Key? key}) : super(key: key);

  @override
  State<Properties> createState() => _PropertiesState();
}

class _PropertiesState extends State<Properties> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
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
                                  "assets/images/house.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Find Properties to live",
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
                                      builder: (context) => postPropertiesFeed()),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
