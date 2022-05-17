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
      child: Material(
        color: Color.fromRGBO(50, 175, 150, 1),

        child: ListView(
          padding: padding,
          children: <Widget>[
              const SizedBox(height: 48),
              buildMenuItem(
                text: 'Group 1',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 0),
              ),

              Divider(color: Colors.greenAccent,),

              buildMenuItem(
                text: 'Group 2',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 1),
              ),

            Divider(color: Colors.greenAccent,),

          ],
        ),
      ),
      
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,})
  {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color,),
      title: Text(text, style: TextStyle(color: color),),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => group1(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => group2(),
        ));
        break;
    }
  }

}