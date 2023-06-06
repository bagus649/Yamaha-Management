import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled2/Firestore/edit.dart';
import 'package:untitled2/Firestore/search.dart';
import 'package:intl/intl.dart';
class Form1 extends StatefulWidget {
  const Form1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Form1State createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  @override
  final _formKey = GlobalKey<FormState>();
  final fieldText = TextEditingController();

  // final Timestamp



  // TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);

  // show time picker method

  TextEditingController dateinput = TextEditingController();
  // final TextEditingController _timeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nohpController = TextEditingController();
  final TextEditingController _produkController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final CollectionReference _arsip =
  FirebaseFirestore.instance.collection('arsip');

  double nilaiSlider = 1;
  bool nilaiCheckBox = false;
  bool nilaiSwitch = true;

  bool visible = false;

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  void clearText() {
    fieldText.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Tambah Data"),
        actions: <Widget>[
          GestureDetector(
            onTap: () { Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => edit()),
        );},
            child: const Icon(Icons.edit),
          ), GestureDetector(

            child: const Icon(Icons.edit,color: Colors.blue,),
          ),

          GestureDetector(
            onTap: () { Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => search()),
        );},
            child: const Icon(Icons.search),
          )

        ],
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('img/biru.jpg'), fit: BoxFit.cover),
        ),
        height: 1000,
        child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: dateinput,
                    decoration:  InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "contoh: 02-01-2022",
                      labelText: "Tanggal",

                      icon: Icon(Icons.calendar_month,color: Colors.white,),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{2,}$');
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      }
                      if (!regex.hasMatch(value)) {
                        return ("please enter date");
                      } else {
                        return null;
                      }

                    },
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context, initialDate: DateTime.now(),
                          firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101)
                      );

                      if(pickedDate != null ){
                        var now = new DateTime.now();

                        var formatter = new DateFormat('dd-MM-yyyy');
                        String formattedTime = DateFormat('kk:mm:a').format(now);
                        String formattedDate = formatter.format(pickedDate);
                        print(formattedTime);
                        print(formattedDate);
                        setState(() {
                          dateinput.text = formattedDate; //set output date to TextField value.
                        });
                      }else{
                        print("Date is not selected");
                      }
                    },
                  ),
                ), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _nameController,
                    decoration:  InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "contoh: Toni",
                      labelText: "Nama Lengkap",
                      icon: Icon(Icons.people,color: Colors.white,),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _nohpController,
                    decoration: new InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "contoh: 082232232323",
                      labelText: "No Hanphone",
                      icon: Icon(Icons.numbers,color: Colors.white,),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nomor tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _produkController,
                    decoration: new InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "contoh: tiket",
                      labelText: "Produk",
                      icon: Icon(Icons.indeterminate_check_box_rounded,color: Colors.white,),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'tiket tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(


                    controller: _priceController,
                    decoration: new InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "contoh: 70.0000",
                      labelText: "Harga",
                      icon: Icon(Icons.price_change_sharp,color: Colors.white,),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Harga tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(17.0),
                child:  ElevatedButton(
                  style: ElevatedButton.styleFrom(

                    onPrimary: Colors.white,
                    primary: Colors.blue,
                    onSurface: Colors.grey,
                    side: BorderSide(color: Colors.black12, width: 1),
                    elevation: 20,
                    minimumSize: Size(360,50),
                    // shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                  ),

                  child: Text(

                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  // color: Colors.blue,

                  onPressed: () async{
                    setState(() {
                      visible = true;
                    });


                    // String string = dateFormat.format(DateTime.now());
                    String date = dateinput.text;
                    final String name = _nameController.text;
                    final String nohp = _nohpController.text;
                    final String produk = _produkController.text;
                    final String? price = _priceController.text;
                    await _arsip.add({"date": date,"name": name,"nohp": nohp,"produk": produk, "price": price});

                    dateinput.text = '';
                    _nameController.text = '';
                    _nohpController.text = '';
                    _produkController.text='';
                    _priceController.text = 'Rp.';
                    // fieldText.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const search()),
                    );

                  },



                ),
                )




              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}