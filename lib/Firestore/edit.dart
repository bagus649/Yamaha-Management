
// import 'dart:html';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/Firestore/search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: edit(),
    );
  }
}

class edit extends StatefulWidget {
  const edit({Key? key}) : super(key: key);

  @override
  _editState createState() => _editState();
}




class _editState extends State<edit> {
  // text fields' controllers
  DateTime _dateTime = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");


  // TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);

  // show time picker method

  TextEditingController dateinput = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _nohpController = TextEditingController();
  final TextEditingController _produkController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final CollectionReference _arsip =
  FirebaseFirestore.instance.collection('arsip');

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: dateinput,
                  decoration: const InputDecoration(labelText: 'Name'),
                ), TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ), TextField(
                  controller: _nohpController,
                  decoration: const InputDecoration(labelText: 'No HandPhone'),
                ),TextField(
                  controller: _produkController,
                  decoration: const InputDecoration(labelText: 'produk'),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    String date = dateinput.text;
                    final String name = _nameController.text;
                    final String nohp = _nohpController.text;
                    final String produk = _produkController.text;
                    final String? price = _priceController.text;
                    if (price != null) {
                      await _arsip.add({"date": date,"name": name,"nohp": nohp,"produk": produk, "price": price});

                      dateinput.text= '';
                      _nameController.text = '';
                      _nohpController.text = '';
                      _produkController.text='';
                      _priceController.text = 'Rp.';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );

        });
  }
  

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {

      dateinput.text = documentSnapshot['date'];
      _nameController.text = documentSnapshot['name'];
      _nohpController.text = documentSnapshot['nohp'];
      _produkController.text = documentSnapshot['produk'];
      _priceController.text = documentSnapshot['price'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return SafeArea(


            top: true,
            left: false,
            bottom: true,
            right: true,
            minimum: const EdgeInsets.all(30.0),


            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: dateinput,
                  decoration: const InputDecoration(labelText: 'Date'),
                ), TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),TextField(
                  controller: _nohpController,
                  decoration: const InputDecoration(labelText: 'No HandPhone'),
                ),TextField(
                  controller: _produkController,
                  decoration: const InputDecoration(labelText: 'produk'),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text( 'Update'),
                  onPressed: () async {
                    String date = dateinput.text;
                    final String name = _nameController.text;
                    final String nohp = _nohpController.text;
                    final String produk = _produkController.text;
                    final String? price = _priceController.text;
                    if (price != null) {

                      await _arsip
                          .doc(documentSnapshot!.id)
                          .update({"date": date,"name": name,"nohp": nohp,"produk": produk, "price": price});
                      dateinput.text= '';
                      _nameController.text = '';
                      _nohpController.text = '';
                      _produkController.text = '';
                      _priceController.text = 'Rp.';
                      Navigator.of(context).pop();
                    }
                  },
                ),ElevatedButton(
                  child: const Text( 'Delete'),
                  onPressed: () async {
                    final String? price = _priceController.text;
                    if (price != null) {

                      await _arsip
                          .doc(documentSnapshot!.id)
                          .delete();
                      dateinput.text='';
                      _nameController.text = '';
                      _nohpController.text = '';
                      _produkController.text = '';
                      _priceController.text = 'Rp. ';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await _arsip.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Data'),

          actions: <Widget>[
            // GestureDetector(
              // onTap: () => _create(),
              // child: const Icon(Icons.add),
            // )

          ],


        ),

        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('img/biru.jpg'), fit: BoxFit.cover),
            ),
          child:  SafeArea (
            child: StreamBuilder(
              stream: _arsip.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                      return GestureDetector(

                          onDoubleTap: () =>
                              _update(documentSnapshot),

                          child: Card(
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
                                                              text: documentSnapshot['date'],
                                                              style: TextStyle(fontWeight: FontWeight.bold)),
                                                        ], style: TextStyle(fontSize: 14,color:Colors.black)),
                                                      )
                                                  ),  Container(

                                                      margin: EdgeInsets.only(left: 30, top: 10),
                                                      child:
                                                      RichText(

                                                        text: TextSpan(children: <TextSpan>[
                                                          TextSpan(
                                                              text: "Nama : ",
                                                              style: TextStyle(fontStyle: FontStyle.italic)),
                                                          TextSpan(
                                                              text: documentSnapshot['name'],
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
                                                              text: documentSnapshot['nohp'],
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
                                                              text: documentSnapshot['produk'],
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
                                                              text: documentSnapshot['price'],
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

                                  ]))
                      );
                    },
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )

        )



    );
  }
}
//
// Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15.0),
// ),
//
// elevation: 30,
// shadowColor: Colors.black,
// color: Colors.blue[100],
//
//
// //BoxDecor
// child: Column(
//
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.start,
//
// children: [
//
// const SizedBox(width: 30,),Text(documentSnapshot['name']),
// const SizedBox(height: 5,),Text(documentSnapshot['nohp']),
// const SizedBox(height: 5,),Text(documentSnapshot['produk']),
// const SizedBox(height: 5,),Text(documentSnapshot['price'].toString()),
//
// ],
// ),
//
//
//
//
// ),

