import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_project/post_add/add_post.dart';
import 'package:my_project/post_feed/materiles_post_feed.dart';

class MaterilesForm extends StatefulWidget {
  const MaterilesForm({Key? key}) : super(key: key);

  @override
  State<MaterilesForm> createState() => _MaterilesFormState();
}

class _MaterilesFormState extends State<MaterilesForm> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _shopContoller = TextEditingController();
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _areaNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _discriptionController = TextEditingController();

  void dispose() {
    _shopContoller.dispose();
    _gmailController.dispose();
    _contactController.dispose();
    _areaNameController.dispose();
    _addressController.dispose();
    _discriptionController.dispose();

    super.dispose();
  }

  //snackbar

  // getImages(url){
  //   this.urlList.add(url);
  //
  // }

  CollectionReference postMateriles =
      FirebaseFirestore.instance.collection("postMaterils");

  showSnackbar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //Image  variables
  File? _image;
  final picker = ImagePicker();
  String? downloadURL;

//image picker
  Future imagePickerMethod() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (picked != null) {
        _image = File(picked.path);
      } else {
        showSnackbar("no file selected", Duration(milliseconds: 400));
      }
    });
  }

  //end

  // Future<String?> uploadImage() async {
  //   File file = File(_image!.path);
  //   //
  //   String imageName =
  //       'MaterileImage/${DateTime.now().microsecondsSinceEpoch}';
  //   //
  //   String? imageUrl;
  //   try {
  //     await FirebaseStorage.instance.ref(imageName).putFile(file);
  //     imageUrl =
  //     await FirebaseStorage.instance.ref(imageName).getDownloadURL();
  //
  //     if (imageUrl != null) {
  //       setState(() {
  //         _image = null;
  //         // getImages(downloadUrl);
  //       });
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("cancelled"),
  //       ),
  //     );
  //   }
  //   return imageUrl;
  // }
  //Upload Image to firestore
  Future uploadImage() async {
    final postId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("MR Images")
        .child("${postId}postId");
    await ref.putFile(_image!);
    downloadURL = await ref.getDownloadURL();
    print(downloadURL);

    //
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // CollectionReference PostMateriles =  firebaseFirestore.collection("Users").doc(add("PostMAteriles", "Images")) as CollectionReference<Object?>;
    //
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const AddPost()),
              );
            },
            child: const BackButton(
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    height: 950,
                    width: 450,
                    child: Card(
                      elevation: 10,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Stack(
                              children: [
                                if (_image != null)
                                  Positioned(
                                    right: 0,
                                    child: GestureDetector(
                                      child: InkWell(
                                        onTap: () {
                                          _image = null;
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 70,
                                          child: Icon(
                                            Icons.clear,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                Container(
                                  height: 180,
                                  width: MediaQuery.of(context).size.width,
                                  child: GestureDetector(
                                    onTap: () {
                                      imagePickerMethod();
                                    },
                                    child: FittedBox(
                                      child: _image == null
                                          ? Icon(Icons.photo)
                                          : Image.file(_image!),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 80,
                              width: 300,
                              child: TextFormField(
                                controller: _shopContoller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "pleas complete required field";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Shop / company name",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 300,
                              child: TextFormField(
                                controller: _gmailController,
                                decoration: InputDecoration(
                                    hintText: "Gmail",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 300,
                              child: TextFormField(
                                controller: _contactController,
                                decoration: InputDecoration(
                                    hintText: "Contact",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 300,
                              child: TextFormField(
                                controller: _areaNameController,
                                decoration: InputDecoration(
                                    hintText: "Area name",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            Container(
                              height: 150,
                              width: 300,
                              child: TextFormField(
                                maxLines: 4,
                                controller: _addressController,
                                decoration: InputDecoration(
                                    hintText: "Address",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            Container(
                              height: 150,
                              width: 300,
                              child: TextFormField(
                                controller: _discriptionController,
                                maxLines: 4,
                                decoration: InputDecoration(
                                    hintText: "Discription",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 200,
                              child: ElevatedButton(
                                  onPressed: () {
                                    //upload function

                                    if (_image != null) {
                                      uploadImage();
                                    }

                                    if (_formkey.currentState!.validate()) {
                                      String shopName = _shopContoller.text;
                                      String gmail = _gmailController.text;
                                      String contact = _contactController.text;
                                      String areaName =
                                          _areaNameController.text;
                                      String address = _addressController.text;
                                      String description =
                                          _discriptionController.text;

                                      //Create a Map of data
                                      Map<String, String> dataToSend = {
                                        'imgUrl': downloadURL.toString(),
                                        'shopeName': shopName,
                                        'gmail': gmail,
                                        'contact': contact,
                                        'areaName': areaName,
                                        'address': address,
                                        'description': description,
                                      };

                                      //Add a new item
                                      postMateriles.add(dataToSend);
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PostFeed()),
                                    );
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
      ),
    );
  }
}
