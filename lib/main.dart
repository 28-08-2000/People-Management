import 'package:flutter/material.dart';
import 'package:people_management/widget/navigation_drawer_widget.dart';

void main() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),

      appBar: AppBar(title: const Text("Peoples")),

      body: const Center(
        child: Text("This is a home page"),
      ),

    );
  }
}