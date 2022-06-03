import 'package:flutter/material.dart';

// hive database things
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// models
import 'package:people_management/model/group.dart';

// boxes
import 'package:people_management/boxes.dart';

// widgets
import 'package:people_management/widget/groupAdd_dialog.dart';
import 'package:people_management/widget/navigation_drawer_widget.dart';
import 'package:people_management/widget/drawer_button_widget.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // register the generated adapter
  Hive.registerAdapter(groupAdapter());

  // open a box to store all key values related to groups
  await Hive.openBox<group>('group');

  runApp(const MyApp());
}

// starts the app
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'Peoples';

    // material app
    return MaterialApp(
      // title of the app
      title: appName,

      // theme of the app
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(50, 175, 150, 1),

        fontFamily: 'Georgia',
      ),

      // home page of the app
      home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

// Home page
class _MainPageState extends State<MainPage> {

  // to close the box
  @override
  void dispose() {
    Hive.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // navigation page
      drawer: NavigationDrawerWidget(),

      appBar: AppBar(title: const Text("Peoples")),

      body: Builder (
        builder: (context) => Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 32),

          // OPEN DRAWER BUTTON
          child: ButtonWidget(
            icon: Icons.open_in_new,
            text: 'Check Groups',
            onClicked: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        )),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => groupDialog(
              onClickedDone: addGroup,
            ),
          ),
        ),

    );
  }

  Future addGroup(String name) async {
    final groups = group()
      ..name = name
      ..createdDate = DateTime.now();

    final box = Boxes.getGroup();
    box.add(groups);
    //box.put('mykey', transaction);

    // final mybox = Boxes.getTransactions();
    // final myTransaction = mybox.get('key');
    // mybox.values;
    // mybox.keys;
  }

}