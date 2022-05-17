import 'package:flutter/material.dart';
import 'package:people_management/page/group1.dart';
import 'package:people_management/page/group2.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {

    // drawer means side navigation bar
    return Drawer(

      // properties of sidebar
      child: Container(
        color: Color.fromRGBO(50, 175, 150, 1),

        child: ListView(
          children: <Widget>[
              const SizedBox(height: 48,)
          ],
        ),
      ),
      
    );
  }
}