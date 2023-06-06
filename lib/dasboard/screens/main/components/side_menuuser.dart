import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:untitled2/Firestore/search.dart';
import 'package:untitled2/firebase_auth/login.dart';

class SideMenuuser extends StatelessWidget {
  const SideMenuuser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black26,
      child: ListView(
        children: [
          // IconButton(onPressed: (){}, icon: Icon(Icons.safety_check)),
          DrawerHeader(
            child: Image.asset("img/person.png",color: Colors.white),
          ),
          DrawerListTile(
            title: "Chart",
            svgSrc: "img/chart.svg",
            press: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) =>  StackedBarChart()),
              //
              // );
            },
          ),
          DrawerListTile(
            title: "Task",
            svgSrc: "img/task.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Documents",
            svgSrc: "img/document.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => search()),

              );
            },
          ),

          DrawerListTile(
            title: "Notification",
            svgSrc: "img/notif.svg",
            press: () {
            },
          ),
          // DrawerListTile(
          //
          //   title: "Profile",
          //   svgSrc: "img/profile.svg",
          //   press: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => HomePage()),
          //
          //     );
          //   },
          // ),
          DrawerListTile(
            title: "Settings",

            svgSrc: "img/setting.svg",
            press: () {


            },
          ),

          DrawerListTile(
            title: "Logout",
            svgSrc: "img/logout.svg",
            press: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  LoginPage()),

            );},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
         // Matrix4.rotationY(math.pi),
        svgSrc,
        color: Colors.white,
        height: 30,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
