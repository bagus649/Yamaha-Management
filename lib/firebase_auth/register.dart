import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/karyawan/home_page.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _RegisterState();

  bool showProgress = false;
  bool visible = false;

  final _formkey2 = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  // final TextEditingController _nameController = TextEditingController();

  // final TextEditingController confirmpassController =
  //     new TextEditingController();
  // final TextEditingController alamatController = new TextEditingController();
  // final TextEditingController genderController = new TextEditingController();
  // final TextEditingController notelpController = new TextEditingController();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  // String name = '';
  // String nohp = '';
  // String alamat = '';

  // final CollectionReference _karyawan =
  // FirebaseFirestore.instance.collection('karyawan');
  bool _isObscure = true;
  // bool _isObscure2 = true;
  File? file;
  var options = [
    'Admin',
    'User',
  ];
  var _currentItemSelected = "Admin";
  var role = "Admin";


  final List<Map<String, dynamic>> _gender = [
    {
      'label': 'Laki-Laki',
      // 'icon': Icon(Icons.man),
    },
    {
      'label': 'Perempuan',
      // 'icon': Icon(Icons.woman),
      // 'textStyle': TextStyle(color: Colors.red),
    },

    {
      'value': 'starValue',
      'label': '----',

    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('img/biru.jpg'), fit: BoxFit.cover),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          "Tambahkan User",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        SizedBox(
                          height: 50,
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                          controller: emailController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black26,
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.white),
                              enabled: true,
                              icon: Icon(Icons.email),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              )
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                          obscureText: _isObscure,
                          controller: passwordController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }
                                ),
                            filled: true,
                            fillColor: Colors.black26,
                            hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white),
                            enabled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              )
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // TextFormField(
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     // fontFamily: 'OpenSans',
                        //   ),
                        //   obscureText: _isObscure2,
                        //   controller: confirmpassController,
                        //   decoration: InputDecoration(
                        //       icon: Icon(Icons.lock),
                        //     suffixIcon: IconButton(
                        //         icon: Icon(_isObscure2
                        //             ? Icons.visibility_off
                        //             : Icons.visibility),
                        //         onPressed: () {
                        //           setState(() {
                        //             _isObscure2 = !_isObscure2;
                        //           });
                        //         }),
                        //     filled: true,
                        //     fillColor: Colors.black26,
                        //     hintText: 'Confirm Password',
                        //     enabled: true,
                        //       enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(8),
                        //         borderSide: BorderSide(
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //       focusedBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(16),
                        //         borderSide: BorderSide(
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(16),
                        //       )
                        //   ),
                        //   validator: (value) {
                        //     if (confirmpassController.text !=
                        //         passwordController.text) {
                        //       return "Password did not match";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        //   onChanged: (value) {},
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Role : ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            DropdownButton<String>(
                              dropdownColor: Colors.blue[900],
                              isDense: true,
                              isExpanded: false,
                              iconEnabledColor: Colors.white,
                              focusColor: Colors.white,
                              items: options.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(
                                    dropDownStringItem,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValueSelected) {
                                setState(() {
                                  _currentItemSelected = newValueSelected!;
                                  role = newValueSelected;
                                });
                              },
                              value: _currentItemSelected,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              elevation: 5.0,
                              height: 40,
                              onPressed: () {
                                CircularProgressIndicator();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => karyawan(),
                                  ),
                                );
                              },
                              child: Text(
                                "Back to Data User",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                              color: Colors.black12,
                            ),
                            MaterialButton(

                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              elevation: 5.0,
                              height: 40,
                              onPressed: () async {
                                //
                                // // final String name = _nameController.text;
                                // // final String alamat = alamatController.text;
                                // // final String gender = genderController.text;
                                // // final String notelp = notelpController.text;
                                // final String email = emailController.text;
                                // final String pass = passwordController.text;
                                // // await _karyawan.add({"name": name,"alamat": alamat,"gender": gender,"notelp": notelp,"email": email,"pass": pass,});
                                // await _karyawan.add({"name" : name,"email" : email,"pass" : pass,});
                                // // //
                                // _nameController.text = '';
                                // alamatController.text='';
                                // genderController.text='';
                                // notelpController.text='';
                                // emailController.text='';
                                // passwordController.text='';



                                setState(() {
                                  showProgress = true;
                                });
                                signUp(emailController.text,
                                    passwordController.text, role);


                                // AuthServices.signupUser(
                                //     name, nohp, alamat, context);


                              },

                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                              color: Colors.black26,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
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
    );
  }

  void signUp(String email, String password, String role) async {
    CircularProgressIndicator();
    if (_formkey2.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, role)})
          .catchError((e) {});



    }
  }

  postDetailsToFirestore(String email, String role) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({'email': emailController.text, 'role': role});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => karyawan()));
  }
  // void tambah(String email, String password, String role) async {
  //   CircularProgressIndicator();
  //
  //
  //   if (_formkey.currentState!.validate()) {
  //     _formkey.currentState!.save();
  //     // login
  //          AuthServices.signupUser(
  //         name,nohp,alamat, context);
  //   }
  //
  // }
}
