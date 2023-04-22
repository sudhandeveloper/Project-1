import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                        height: 340,
                        width: 515,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 280,
                              width: 500,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 20,
                                child: Card(
                                  child: Image(
                                    image: AssetImage(
                                      "assets/images/pexels-pixabay-277559 (1).jpg",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        "Welcome to the Society",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 450,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, top: 9),
                      child: Text(
                        "Bring Your dream Into Reality!!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Divider(
                  endIndent: 3,
                  color: Colors.black,
                  thickness: 1,
                ),
                const Card(
                  child: Card(
                    elevation: 20,
                    child: Image(
                      image: AssetImage(
                        "assets/images/ppp.jpg",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  height: 300,
                  width: 600,
                  child: Card(
                    elevation: 30,
                    child: Card(
                      child: Image(
                        image: AssetImage(
                          "assets/images/pexels-max-rahubovskiy-7031407.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "There is no end!!",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 26,
                      color: Colors.black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
