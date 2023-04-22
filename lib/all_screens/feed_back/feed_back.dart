import 'package:flutter/material.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SizedBox(
                  height: 700,
                  width: 450,
                  child: Card(
                    elevation: 30,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Feed Back",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Container(
                          height: 80,
                          width: 300,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "name",
                              hintStyle: TextStyle(
                                color: Colors.grey
                              )

                            ),
                          ),
                        ), Container(
                          height: 80,
                          width: 300,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "gmail",
                              hintStyle: TextStyle(
                                color: Colors.grey
                              )

                            ),
                          ),
                        ),Container(
                          height: 80,
                          width: 300,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "phone no",
                              hintStyle: TextStyle(
                                color: Colors.grey
                              )

                            ),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 300,
                          child: TextFormField(
                              maxLines: 10,
                            decoration: InputDecoration(
                              hintText: "Discription",
                              hintStyle: TextStyle(
                                color: Colors.grey
                              )

                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          height: 40,
                          width: 200,
                          child: ElevatedButton(

                              onPressed: (){}, child:Text("Submit")),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
