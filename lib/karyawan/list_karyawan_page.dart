import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class ListkaryawanPage extends StatefulWidget {
  ListkaryawanPage({Key? key}) : super(key: key);

  @override
  _ListkaryawanPageState createState() => _ListkaryawanPageState();
}

class _ListkaryawanPageState extends State<ListkaryawanPage> {
  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  // For Deleting User
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return users
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  1: FixedColumnWidth(140),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: Center(
                            child: Text(
                              'Role',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: Center(
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: Center(
                            child: Text(
                              'Action',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (var i = 0; i < storedocs.length; i++) ...[
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            height: 50,
                            // width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(

                                    child: Text(storedocs[i]['role'],
                                        style: TextStyle(fontSize: 18.0,color: Colors.white))),
                              ],
                            ),
                          ),
                        ),
                        TableCell(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              height: 50,
                              // width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      child: Text(storedocs[i]['email'],
                                          style: TextStyle(fontSize: 18.0,color: Colors.white))),
                                ],
                              ),
                            ),
                          ),
                        ),

                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () =>
                                    {deleteUser(storedocs[i]['id'])},
                                // onPressed: () => {
                                // Navigator.push(
                                // context,
                                // MaterialPageRoute(
                                // builder: (context) => UpdatekaryawanPage(
                                // id: storedocs[i]['id']),
                                // ),
                                // )
                                // },
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: Colors.red,
                                ),
                                // GestureDetector(
                                //     onTap: () => {
                                //       Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //           builder: (context) => UpdatekaryawanPage(
                                //               id: storedocs[i]['id']),
                                //         ),
                                //       )
                                //     },
                                //     onLongPress:  () =>
                                //     {deleteUser(storedocs[i]['id'])},
                                //     child: Text(storedocs[i]['role'],
                                //         style: TextStyle(fontSize: 18.0))
                                //
                                // ),
                              )
                            ],
                          ),
                        ),
                        // TableCell(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       IconButton(
                        //
                        //         onPressed: () => {
                        //           Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //               builder: (context) => UpdatekaryawanPage(
                        //                   id: storedocs[i]['id']),
                        //             ),
                        //           )
                        //         },
                        //         icon: Icon(
                        //           Icons.edit,
                        //           color: Colors.orange,
                        //         ),
                        //       ),
                        //       // IconButton(
                        //       //   onPressed: () =>
                        //       //   {deleteUser(storedocs[i]['id'])},
                        //       //   icon: Icon(
                        //       //     Icons.delete,
                        //       //     color: Colors.red,
                        //       //   ),
                        //       // ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          );
        });
  }
}
