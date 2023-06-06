// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/Firestore/form.dart';
import 'package:untitled2/dasboard/screens/main/main_screen.dart';
import 'package:untitled2/dasboard/screens/main/main_user.dart';
import 'package:untitled2/firebase_auth/login.dart';
import 'dasboard/constants.dart';
import 'dasboard/controllers/MenuController.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.blue),
        canvasColor: secondaryColor,
      ),
      // debugShowCheckedModeBanner: false,
      // Add this
      home : MultiProvider(
        // key: Colors.black,

        providers: [

          ChangeNotifierProvider(create: (context) => MenuController()),

          Provider<MainScreen>(
            create: (context) => MainScreen(),
          ),
          Provider<MainScreenuser>(
            create: (context) => MainScreenuser(),
          ),
        ],
        child: MaterialApp(
          // color: Colors.blue,
          home: LoginPage(),
        ),
    )
    );
  }

}


