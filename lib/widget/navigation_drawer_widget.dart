import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:people_management/page/group1.dart';
import 'package:people_management/page/group2.dart';
import 'package:people_management/page/user_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    // demo user details
    final name = "DSM";
    final email = "DSM@freeguy.com";
    final urlImage = 'https://images.unsplash.com/photo-1501776527793-c75adab77089?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxwcm9maWxlLWxpa2VkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500';

    // drawer means side navigation bar
    return Drawer(

      // properties of sidebar
      child: Material(
        color: Color.fromRGBO(50, 175, 150, 1),

        child: ListView(
          children: <Widget>[

              // header of user
            buildHeader (
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserPage(
                    name: name,
                    urlImage: urlImage,
                  ),
              )),
            ),

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

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
}) =>
  InkWell(
    onTap: onClicked,
      child: Container(
        padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
        child: Row(
          children: [
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 24,
              backgroundColor: Color.fromRGBO(30, 60, 168, 1),
              child: Icon(Icons.add_comment_outlined, color: Colors.white),
            )
          ],
        ),

    ),
  );

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
    Navigator.of(context).pop();

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