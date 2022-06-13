import 'package:flutter/material.dart';
import 'package:people_management/page/group1.dart';
import 'package:people_management/page/group2.dart';
import 'package:people_management/page/user_page.dart';

// import providers
import 'package:people_management/providers/group_name.dart';

import 'package:provider/provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    // demo user details
    const name = "DSM";
    const email = "DSM@freeguy.com";
    const urlImage = 'https://images.unsplash.com/photo-1501776527793-c75adab77089?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxwcm9maWxlLWxpa2VkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500';

    
    // iterate the group names and print them
    List group_names = Provider.of<Group>(context, listen: false).groupNames;

    // drawer means side navigation bar
    return Drawer(

      // properties of sidebar
      child: Material(
        color: const Color.fromRGBO(50, 175, 150, 1),

        child: ListView(
          children: <Widget>[

              // header of user
            buildHeader (
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UserPage(
                    name: name,
                    urlImage: urlImage,
                  ),
              )),
            ),

              const SizedBox(height: 48),
              buildMenuItem(
                text: 'Group 1',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 100),
              ),

              const Divider(color: Colors.greenAccent,),

              buildMenuItem(
                text: 'Group 2',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 101),
              ),

            const Divider(color: Colors.greenAccent,),
            
            // print the group names            
            for (var i in group_names) buildMenuItem(
                text: i.toString(),
                icon: Icons.people,
                onClicked: () => selectedItem(context, i),
              ),

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
        padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
        child: Row(
          children: [
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            const CircleAvatar(
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
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color,),
      title: Text(text, style: const TextStyle(color: color),),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, var index) {
    Navigator.of(context).pop();

    switch (index) {
      case 100:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => group1(),
        ));
        break;
      case 101:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => group2(),
        ));
        break;

      // Go to Page Containg Group Data
      default:

        print("The group called is" + index.toString());

        Navigator.pushNamed(context, '/groups', arguments: index);
        break;
    }
  }

}