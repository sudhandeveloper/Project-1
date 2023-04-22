import 'package:flutter/material.dart';

class MaterilesInfoScreen extends StatefulWidget {
  const MaterilesInfoScreen({Key? key}) : super(key: key);

  @override
  State<MaterilesInfoScreen> createState() => _MaterilesInfoScreenState();
}

class _MaterilesInfoScreenState extends State<MaterilesInfoScreen> {
  List Url = [
    "https://dreamcivil.com/wp-content/uploads/2019/12/cement_arthik-min-300x199.jpg",
    "https://dreamcivil.com/wp-content/uploads/2021/09/river-sand-500x500-min-300x225.jpg",
    "https://dreamcivil.com/wp-content/uploads/2020/09/rebar-roll-min.jpg",
    "https://dreamcivil.com/wp-content/uploads/2020/06/sika-self-compacting-concrete-712x374-min-300x158.jpg",
    "https://dreamcivil.com/wp-content/uploads/2020/04/aggregates-applications-uses-min-300x185.jpg",
    "https://dreamcivil.com/wp-content/uploads/2021/09/bricks-construction-min-300x200.jpg",
    "https://dreamcivil.com/wp-content/uploads/2021/09/TYPES-OF-CONCRETE-BLOCKS-min-300x198.jpg"
  ];

  List title = [
    "Cement",
    "Sand",
    "Steel",
    "Concrete",
    "Aggregate",
    "Bricks",
    "Block"
  ];
  List Subtitle = [
    "Used as a binder in concrete, an essential material for all types of construction.",
    " Used to give bulk, strength, and other properties to construction materials like asphalt and concrete Also a major component for rendering.",
    "Used in RCC construction.",
    "Used for the construction of foundations, roads, bridges, walls, etc.",
    " Used in construction to provide drainage, fill voids, protect pipes, and provide hard surfaces.",
    "Used as a structural as well as a non-structural to make walls.",
    " Used for various purposes such as the construction of load-bearing walls, retaining walls, partitions, and foundations."
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
          child: ListView.builder(
        physics: ScrollPhysics(),
        itemCount: 7,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: 650,
              color: Colors.green,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      height: 600,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 19, top: 18),
                              child: Container(
                                height: 230,
                                width: 230,
                                child: Card(
                                  elevation: 20,
                                  child: Image.network(
                                    Url[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 50),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        title[index],
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    Subtitle[index],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      )),
    ));
  }
}
