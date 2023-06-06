import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled2/dasboard/screens/main/main_screen.dart';
import 'package:untitled2/dasboard/screens/main/main_user.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey1 = GlobalKey<FormState>();
  final TextEditingController _username = new TextEditingController();
  final TextEditingController _pass = new TextEditingController();
  final kHintTextStyle = TextStyle(
    color: Colors.white54,
  );

  final kLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  final _auth = FirebaseAuth.instance;
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
              // color: Colors.orangeAccent[700],
              // width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1.00,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey1,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   height: 120,
                        // ),
                        Image.asset("img/yamaha.png"),
                        SizedBox(
                          height:55,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 23),
                            )),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                           fontSize: 22
                          ),

                          controller: _username,
                          decoration:  InputDecoration(

                              fillColor: Colors.black12,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
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
                              hintText: "    Please Enter Email",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              )),

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
                          onSaved: (value) {
                            _username.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 23),
                            )),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22
                          ),
                          controller: _pass,
                          obscureText: _isObscure3,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure3
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                }),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              fillColor: Colors.black12,
                              filled: true,
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
                              hintText: "Please Enter Password",
                              hintStyle: TextStyle(color: Colors.white),
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
                          onSaved: (value) {
                            _pass.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16),
                            )),
                        SizedBox(
                          height: 70,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Enter Your Email And Password To Login ',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16),
                            )),
                        SizedBox(
                          height: 10,
                        ),




                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(31.0))),
                          elevation: 5.0,
                          height: 60,
                          minWidth: 700,
                          onPressed: () {
                            setState(() {
                              visible = true;
                            });
                            signIn(
                                _username.text, _pass.text);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 23,color: Colors.lightBlueAccent
                            ),
                          ),
                          color: Colors.white10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: visible,
                            child: Container(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            ))),
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

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "User") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  MainScreenuser(),
            ),
          );
        }else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  MainScreen(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey1.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}



