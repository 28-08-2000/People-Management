import 'package:flutter/material.dart';
import 'package:people_management/widget/navigation_drawer_widget.dart';
import 'package:people_management/widget/drawer_button_widget.dart';
import 'package:people_management/page/Group_Data.dart';

// import providers
import 'package:people_management/providers/group_name.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => Group()),
      ],

      child: const MyApp(),
      
      ),
    );
}

// starts the app
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'Peoples';

    // material app
    return MaterialApp(
        title: appName,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: const Color.fromRGBO(50, 175, 150, 1),
          fontFamily: 'Georgia',
        ),

        // home page of the app
        // home: const MainPage()
        initialRoute: '/home',

        // add routes
        routes: {

          '/home': (context) => const MainPage(),
          '/groups': (context) => const Group_Data(),
        },

    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

// Home page
class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {

    // to get the name of the group
    TextEditingController groupNameController = TextEditingController();

    return Scaffold(
      drawer: NavigationDrawerWidget(),

      appBar: AppBar(title: const Text("Peoples")),

      body: Builder (
        builder: (context) => Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 32),

          // list of widgets
          child: ListView(
              children: <Widget>[
                
                // text field to make new group
                TextFormField(
                  // controller for this field
                  controller: groupNameController,

                  decoration: const InputDecoration(
                    hintText: 'Enter Group Name',
                  ),

                ),

                ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    String new_group = groupNameController.text;

                    if (new_group.isNotEmpty &&  !Provider.of<Group>(context, listen: false).groupNames.contains(new_group)) {

                        // add the name to group names provider
                        context.read<Group>().addGroup(groupNameController.text);

                        // print some details
                        print(Provider.of<Group>(context, listen: false).groupCount);
                        print(Provider.of<Group>(context, listen: false).groupNames);

                        // empty the text form field after submit
                        groupNameController.text = "";
                    }
                  },
                  
                  child: const Text('Submit'),
                ),

                const SizedBox(height: 108),

                // button to opne the drawer
                ButtonWidget(
                    icon: Icons.open_in_new,
                    text: 'Check Groups',
                    onClicked: () {
                      Scaffold.of(context).openDrawer();
                    },
                ),

          ]
          ),

        )
    )
    );
  }
}
