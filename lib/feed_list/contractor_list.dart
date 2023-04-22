import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//
// class ContractorsList extends StatefulWidget {
//    ContractorsList({Key? key}) : super(key: key);
//   _stream = postContractors.snapshots();
//    late Stream<QuerySnapshot> _stream;
//
//
//
//    @override
//   State<ContractorsList> createState() => _ContractorsListState();
// }
//
// class _ContractorsListState extends State<ContractorsList> {
//
//
//   CollectionReference postContractors =
//   FirebaseFirestore.instance.collection('postContractors').snapshots() as CollectionReference<Object?>;
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//      child: StreamBuilder(
//
//        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
//        {
//
//
//          },),
//     );
//   }
// }
// child: StreamBuilder(
//   stream:postContractors,
//
//   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     if (snapshot.hasError) {
//       return const Text('Something went wrong');
//     }
//
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Text("Loading");
//     }
//     return GridView.builder(
//       shrinkWrap: true,
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 300,
//           childAspectRatio: 2 / 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10),
//       itemCount: snapshot.data.size,
//       itemBuilder: (BuildContext context, int i) {
//         var data = snapshot.data.docs[i];
//
//         return Column(
//           children: [
//             Text(data['shopName']),
//           ],
//         );
//       },
//     );
//   },
// ),

class ContractorsList extends StatefulWidget {
  ContractorsList({Key? key}) : super(key: key);

  @override
  State<ContractorsList> createState() => _ContractorsListState();
}

class _ContractorsListState extends State<ContractorsList> {
  CollectionReference postContractors =
      FirebaseFirestore.instance.collection("postContractors");
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: FutureBuilder<QuerySnapshot>(
        future: postContractors.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Somthing wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 800,
                childAspectRatio: 4 / 7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 5),
            itemCount: snapshot.data!.size,
            itemBuilder: (BuildContext context, int i) {
              final data = snapshot.data!.docs[i];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent)),
                      width: 450,
                      child: Card(
                        elevation: 30,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 30,
                                right: 30,
                              ),
                              child: SizedBox(
                                height: 400,
                                width: 500,
                                child: Image.network(
                                  data['imgUrl'],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 300,
                              width: 430,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.greenAccent)),
                              child: Card(
                                elevation: 30,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Gmail               :",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            data['gmail'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Contact           :",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            data['contact'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 17,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Location         :",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              data['address'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 17,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Discription     :",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              data['description'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
//
// Text(data['shopeName']),
// Text(data['shopeName']),
