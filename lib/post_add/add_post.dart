import 'package:flutter/material.dart';
import 'package:my_project/feed_list/cunstruction_list.dart';
import 'package:my_project/post_add/category_screens/properties_form.dart';
import 'category_screens/Materiel_details.dart';
import 'category_screens/contractors.dart';
import 'category_screens/cunstruction_tools_form.dart';
import 'icon_button/icon_button.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 70,
              width: 500,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 16,
                      ),
                      child: Text(
                        " Choose tha suitable catogary to post add ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: const BoxDecoration(),
                height: 500,
                width: 450,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 20,
                  color: Colors.white,
                  child: GridView.count(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Catagory(
                        title: '\tMateriles\n \t\t\t\t\t\t\t\&\nResources',
                        icon: Icons.cabin_rounded,
                        warna: Colors.orange,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MaterilesForm()),
                          );
                        },
                      ),
                       Catagory(
                        title: 'properties',
                        icon: Icons.build,
                        warna: Colors.orange,
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PropertiesForm()),
                          );
                        },

                      ),
                       Catagory(
                        title: 'Cunstruction tools',
                        icon: Icons.cabin_rounded,
                        warna: Colors.orange,
                        onTap: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              CunstructionToolssForm()),
                        );},

                      ),
                       Catagory(
                        title: 'Contractors',
                        icon: Icons.home_filled,
                        warna: Colors.orange,
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                postContractors()),
                          );},
                      ),
                    ],
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
