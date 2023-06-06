
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled2/Firestore/edit.dart';
import '../firebase_options.dart';
// import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    home: search(),
  ));
}

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}


class _searchState extends State<search> {
  String name = "";
  String date = "";
  List<Map<String, dynamic>> data = [
    {
      // 'name': 'Ipung',
      // 'nohp' : '08232423',
      // 'produk' : 'oli',
      // 'price' : 'Rp. 70.000',

    },

  ];



  addData() async {
    if(data.isNotEmpty){
      print('Tulisan ini akan tampil, jika kondisi bernilai true');
      data.clear();
    }
    else for (var element in data) {
      FirebaseFirestore.instance.collection('arsip').add(element);
    }
    print('all data added');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Card(

              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'Search...'),
                onChanged: (val) {
                  setState(() {
                    name = val;
                    date = val;
                  });
                },
              ),
            ),

        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('img/biru.jpg'), fit: BoxFit.cover),
            ),
          child:  GestureDetector (
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('arsip').snapshots(),
              builder: (context, snapshots) {
                return (snapshots.connectionState == ConnectionState.waiting)
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : ListView.builder(
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshots.data!.docs[index].data()
                      as Map<String, dynamic>;

                      if (name.isEmpty) {
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.deepPurple)
                            ),


                            elevation: 5,
                            shadowColor: Colors.blue,
                            color: Colors.white,


                            //BoxDecor
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SafeArea(

                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          radius: 50,
                                          backgroundImage:
                                          ExactAssetImage('img/person.png', scale: 2,),
                                        ),
                                        SafeArea(
                                            child: Column(
                                              // mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                ListTile(

                                                )
                                              ],
                                            )
                                        ),
                                      ],
                                    ),
                                  ),

                                ]));


                        return  Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.deepPurple)
                            ),


                            elevation: 5,
                            shadowColor: Colors.blue,
                            color: Colors.white,


                            //BoxDecor
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SafeArea(

                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 50,
                                          backgroundImage:
                                          ExactAssetImage('img/person.png', scale: 2,),
                                        ),
                                        SafeArea(

                                            child: Column(
                                              // mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[

                                                Container(

                                                    margin: EdgeInsets.only(left: 30, top: 10),
                                                    child:
                                                    RichText(

                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Date : ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['date'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color:Colors.black)),
                                                    )
                                                ), Container(

                                                    margin: EdgeInsets.only(left: 30, top: 10),
                                                    child:
                                                    RichText(

                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Nama : ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['name'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color:Colors.black)),
                                                    )
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(left: 30),
                                                    child: RichText(
                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "No Handphone: ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['nohp'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color: Colors.black)),
                                                    )),
                                                Container(
                                                    margin: EdgeInsets.only(left: 30),
                                                    child: RichText(
                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Produk: ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['produk'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color: Colors.black)),
                                                    )),Container(
                                                    margin: EdgeInsets.only(left: 30),
                                                    child: RichText(
                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Harga: ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['price'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color: Colors.black)),
                                                    )),
                                              ],
                                            )
                                        ),


                                        // Container(
                                        //
                                        //
                                        //   child: Column(
                                        //     children: [
                                        //
                                        //       const SizedBox(width: 30,),Text(documentSnapshot['name']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['nohp']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['produk']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['price'].toString()),
                                        //
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),


                                  // ButtonTheme(
                                  //   child: ButtonBar(
                                  //     children: <Widget>[
                                  //       ElevatedButton(
                                  //         child: const Text('Edit', style: TextStyle(color: Colors.white)),
                                  //         onPressed: () {},
                                  //       ),
                                  //       ElevatedButton(
                                  //         child: const Text('Delete', style: TextStyle(color: Colors.white)),
                                  //         onPressed: () {},
                                  //       ),
                                  //       ],
                                  //     ),
                                  // ),

                                ]));
                      } if (date.isEmpty) {
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.deepPurple)
                            ),


                            elevation: 5,
                            shadowColor: Colors.blue,
                            color: Colors.white,


                            //BoxDecor
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SafeArea(

                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          radius: 50,
                                          backgroundImage:
                                          ExactAssetImage('img/person.png', scale: 2,),
                                        ),
                                        SafeArea(
                                            child: Column(
                                              // mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                ListTile(

                                                )


                                              ],
                                            )
                                        ),


                                        // Container(
                                        //
                                        //
                                        //   child: Column(
                                        //     children: [
                                        //
                                        //       const SizedBox(width: 30,),Text(documentSnapshot['name']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['nohp']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['produk']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['price'].toString()),
                                        //
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),


                                  // ButtonTheme(
                                  //   child: ButtonBar(
                                  //     children: <Widget>[
                                  //       ElevatedButton(
                                  //         child: const Text('Edit', style: TextStyle(color: Colors.white)),
                                  //         onPressed: () {},
                                  //       ),
                                  //       ElevatedButton(
                                  //         child: const Text('Delete', style: TextStyle(color: Colors.white)),
                                  //         onPressed: () {},
                                  //       ),
                                  //       ],
                                  //     ),
                                  // ),

                                ]));


                        return  Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.deepPurple)
                            ),


                            elevation: 5,
                            shadowColor: Colors.blue,
                            color: Colors.white,


                            //BoxDecor
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SafeArea(

                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 50,
                                          backgroundImage:
                                          ExactAssetImage('img/person.png', scale: 2,),
                                        ),
                                        SafeArea(
                                            child: Column(
                                              // mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Container(

                                                    margin: EdgeInsets.only(left: 30, top: 10),
                                                    child:
                                                    RichText(

                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Date : ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['date'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color:Colors.black)),
                                                    )
                                                ), Container(

                                                    margin: EdgeInsets.only(left: 30, top: 10),
                                                    child:
                                                    RichText(

                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Nama : ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['name'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color:Colors.black)),
                                                    )
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(left: 30),
                                                    child: RichText(
                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "No Handphone: ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['nohp'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color: Colors.black)),
                                                    )),
                                                Container(
                                                    margin: EdgeInsets.only(left: 30),
                                                    child: RichText(
                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Produk: ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['produk'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color: Colors.black)),
                                                    )),Container(
                                                    margin: EdgeInsets.only(left: 30),
                                                    child: RichText(
                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Harga: ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['price'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color: Colors.black)),
                                                    )),
                                              ],
                                            )
                                        ),


                                        // Container(
                                        //
                                        //
                                        //   child: Column(
                                        //     children: [
                                        //
                                        //       const SizedBox(width: 30,),Text(documentSnapshot['name']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['nohp']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['produk']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['price'].toString()),
                                        //
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),


                                  // ButtonTheme(
                                  //   child: ButtonBar(
                                  //     children: <Widget>[
                                  //       ElevatedButton(
                                  //         child: const Text('Edit', style: TextStyle(color: Colors.white)),
                                  //         onPressed: () {},
                                  //       ),
                                  //       ElevatedButton(
                                  //         child: const Text('Delete', style: TextStyle(color: Colors.white)),
                                  //         onPressed: () {},
                                  //       ),
                                  //       ],
                                  //     ),
                                  // ),

                                ]));
                      }
                      if (data['name']
                          .toString()
                          .toLowerCase()
                          .startsWith(name.toLowerCase())) {
                        return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.deepPurple)
                            ),


                            elevation: 5,
                            shadowColor: Colors.blue,
                            color: Colors.white,


                            //BoxDecor
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SafeArea(

                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 50,
                                          backgroundImage:
                                          ExactAssetImage('img/person.png', scale: 2,),
                                        ),
                                        SafeArea(
                                            child: Column(
                                              // mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Container(

                                                    margin: EdgeInsets.only(left: 30, top: 10),
                                                    child:
                                                    RichText(

                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Date : ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['date'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color:Colors.black)),
                                                    )
                                                ), Container(

                                                    margin: EdgeInsets.only(left: 30, top: 10),
                                                    child:
                                                    RichText(

                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Nama : ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['name'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color:Colors.black)),
                                                    )
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(left: 30),
                                                    child: RichText(
                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "No Handphone: ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['nohp'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color: Colors.black)),
                                                    )),
                                                Container(
                                                    margin: EdgeInsets.only(left: 30),
                                                    child: RichText(
                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Produk: ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['produk'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color: Colors.black)),
                                                    )),Container(
                                                    margin: EdgeInsets.only(left: 30),
                                                    child: RichText(
                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Harga: ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['price'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color: Colors.black)),
                                                    )),
                                              ],
                                            )
                                        ),


                                        // Container(
                                        //
                                        //
                                        //   child: Column(
                                        //     children: [
                                        //
                                        //       const SizedBox(width: 30,),Text(documentSnapshot['name']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['nohp']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['produk']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['price'].toString()),
                                        //
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),


                                  // ButtonTheme(
                                  //   child: ButtonBar(
                                  //     children: <Widget>[
                                  //       ElevatedButton(
                                  //         child: const Text('Edit', style: TextStyle(color: Colors.white)),
                                  //         onPressed: () {},
                                  //       ),
                                  //       ElevatedButton(
                                  //         child: const Text('Delete', style: TextStyle(color: Colors.white)),
                                  //         onPressed: () {},
                                  //       ),
                                  //       ],
                                  //     ),
                                  // ),

                                ]));
                      } if (data['date']
                          .toString()
                          .toLowerCase()
                          .startsWith(date.toLowerCase())) {
                        return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.deepPurple)
                            ),


                            elevation: 5,
                            shadowColor: Colors.blue,
                            color: Colors.white,


                            //BoxDecor
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SafeArea(

                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 50,
                                          backgroundImage:
                                          ExactAssetImage('img/person.png', scale: 2,),
                                        ),
                                        SafeArea(
                                            child: Column(
                                              // mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Container(

                                                    margin: EdgeInsets.only(left: 30, top: 10),
                                                    child:
                                                    RichText(

                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Date : ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['date'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color:Colors.black)),
                                                    )
                                                ), Container(

                                                    margin: EdgeInsets.only(left: 30, top: 10),
                                                    child:
                                                    RichText(

                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Nama : ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['name'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color:Colors.black)),
                                                    )
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(left: 30),
                                                    child: RichText(
                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "No Handphone: ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['nohp'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color: Colors.black)),
                                                    )),
                                                Container(
                                                    margin: EdgeInsets.only(left: 30),
                                                    child: RichText(
                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Produk: ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['produk'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color: Colors.black)),
                                                    )),Container(
                                                    margin: EdgeInsets.only(left: 30),
                                                    child: RichText(
                                                      text: TextSpan(children: <TextSpan>[
                                                        TextSpan(
                                                            text: "Harga: ",
                                                            style: TextStyle(fontStyle: FontStyle.italic)),
                                                        TextSpan(
                                                            text: data['price'],
                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ], style: TextStyle(fontSize: 14,color: Colors.black)),
                                                    )),
                                              ],
                                            )
                                        ),


                                        // Container(
                                        //
                                        //
                                        //   child: Column(
                                        //     children: [
                                        //
                                        //       const SizedBox(width: 30,),Text(documentSnapshot['name']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['nohp']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['produk']),
                                        //       const SizedBox(height: 5,),Text(documentSnapshot['price'].toString()),
                                        //
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),


                                  // ButtonTheme(
                                  //   child: ButtonBar(
                                  //     children: <Widget>[
                                  //       ElevatedButton(
                                  //         child: const Text('Edit', style: TextStyle(color: Colors.white)),
                                  //         onPressed: () {},
                                  //       ),
                                  //       ElevatedButton(
                                  //         child: const Text('Delete', style: TextStyle(color: Colors.white)),
                                  //         onPressed: () {},
                                  //       ),
                                  //       ],
                                  //     ),
                                  // ),

                                ]));
                      }
                      return Container();
                    });
              },
            ) ,
          )
        ),




       );
  }
}