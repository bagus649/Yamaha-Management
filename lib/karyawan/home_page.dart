import 'package:flutter/material.dart';
import 'package:untitled2/dasboard/screens/main/main_screen.dart';
import 'package:untitled2/karyawan/list_karyawan_page.dart';
import 'package:untitled2/firebase_auth/register.dart';

class karyawan extends StatefulWidget {
  karyawan({Key? key}) : super(key: key);

  @override
  _karyawanState createState() => _karyawanState();
}

class _karyawanState extends State<karyawan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
          )
        }, icon: Icon(Icons.arrow_back)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Daftar User'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  ),
                )
              },
              child: Text('Add', style: TextStyle(fontSize: 20.0)),
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('img/biru.jpg'), fit: BoxFit.cover),
        ),
        child: ListkaryawanPage(),
      )

    );
  }
}
