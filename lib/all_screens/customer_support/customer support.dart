import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({Key? key}) : super(key: key);

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  final _formkey = GlobalKey<FormState>();
  bool uploading = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _queriesController = TextEditingController();
  CollectionReference customerSupport =
      FirebaseFirestore.instance.collection("customerSupport");
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
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
                            "Customer support",
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
                              controller: _nameController,
                              decoration: InputDecoration(
                                  hintText: "name",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 300,
                            child: TextFormField(
                              controller: _gmailController,
                              decoration: InputDecoration(
                                  hintText: "gmail",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 300,
                            child: TextFormField(
                              controller: _contactController,
                              decoration: InputDecoration(
                                  hintText: "phone no",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                          Container(
                            height: 150,
                            width: 300,
                            child: TextFormField(
                              controller: _queriesController,
                              maxLines: 10,
                              decoration: InputDecoration(
                                  hintText: "Tell about Issues your facing ",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 40,
                            width: 200,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    String gmail = _gmailController.text;
                                    String contact = _contactController.text;
                                    String Quries = _queriesController.text;
                                    String Name = _nameController.text;

                                    //Create a Map of data
                                    Map<String, String> dataToSend = {
                                      'Name': Name,
                                      'gmail': gmail,
                                      'contact': contact,
                                      'Quries': Quries,
                                    };

                                    //Add a new item
                                    customerSupport.add(dataToSend);
                                  }
                                },
                                child: Text("Submit")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
