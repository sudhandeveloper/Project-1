import 'package:flutter/material.dart';

class Construction_tools_details extends StatefulWidget {
  const Construction_tools_details({Key? key}) : super(key: key);

  @override
  State<Construction_tools_details> createState() => _Construction_tools_detailsState();
}

class _Construction_tools_detailsState extends State<Construction_tools_details> {
  List Url = [
    "https://i0.wp.com/theconstructor.org/wp-content/uploads/2017/12/bolster.jpg?resize=300%2C218&ssl=1",
    "https://i0.wp.com/theconstructor.org/wp-content/uploads/2017/12/circular-saw.jpg?resize=300%2C243&ssl=1",
    "https://i0.wp.com/theconstructor.org/wp-content/uploads/2017/12/concrete-mixer.jpg?resize=300%2C294&ssl=1",
    "https://i0.wp.com/theconstructor.org/wp-content/uploads/2017/12/crow-bar.jpg?resize=300%2C194&ssl=1",
    "https://i0.wp.com/theconstructor.org/wp-content/uploads/2017/12/digging-bar.jpg?resize=300%2C268&ssl=1",
    "https://i0.wp.com/theconstructor.org/wp-content/uploads/2017/12/drill-machine.jpg?resize=300%2C217&ssl=1",
    "https://i0.wp.com/theconstructor.org/wp-content/uploads/2017/12/end-frames.jpg?resize=300%2C233&ssl=1"
  ];


  List title = [
    "Bolster",
    "Circular Saw",
    "Concrete mixer",
    "Crowbar",
    "Diggingbar",
    "Drill Machine",
    "End Frames"
  ];

  List Subtitle = [
    "Bolster is like chisel but it is used to cut bricks. Its cutting edge is wider than the width of brick. It is useful for accurate cutting of bricks.",
    " Circular saw used to cut the wood boards, frames etc. It is used when accurate cutting is required in less time. It is safer than hand saw.",
    "Concrete mixer is machine which mixes the ingredients water, fine aggregate, coarse aggregate and cement to deliver the perfectly mixed concrete.",
    "Crowbar is used for digging the ground and to remove the roots of trees in the ground, nails etc.",
    " Digging bar is solid metal rod with pin shape at the bottom. It is also used to dig the hard surfaces of ground.",
    "Drill machine is used to make holes in the walls, slabs, doors, window frames etc.",
    "Their use is similar to the line and pins. But instead of pins, L shaped frames are used at the end of thread which hold the brick work effectively and level the alignment accurately."
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
