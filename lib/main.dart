import 'package:flutter/material.dart';
import 'package:people_management/widget/navigation_drawer_widget.dart';
import 'package:people_management/widget/drawer_button_widget.dart';

// import providers
import 'package:people_management/providers/group_name.dart';

// ignore: import_of_legacy_library_into_null_safe
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
        home: const MainPage()
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
                    if (groupNameController.text.isNotEmpty) {

                        // add the name to group names provider
                        print(groupNameController.text);

                        context.read<Group>().addGroup(groupNameController.text);

                        // print some details
                        print(context.watch<Group>().groupCount);
                        print(context.watch<Group>().groupNames);

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
