import 'package:untitled2/dasboard/controllers/MenuController.dart';
import 'package:untitled2/dasboard/responsive.dart';
import 'package:untitled2/dasboard/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/dasboard/screens/main/components/side_menuuser.dart';

import '../dashboard/dashboard_user.dart';
import 'components/side_menu.dart';

class MainScreenuser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenuuser(),
      body: SafeArea(

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenuuser(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreenuser(),
            ),
          ],
        ),
      ),
    );
  }
}
