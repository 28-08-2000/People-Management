import 'package:flutter/material.dart';
// import 'package:people_manage';

class Group_Data extends StatelessWidget {
  const Group_Data({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeData = ModalRoute.of(context)?.settings.arguments as String;
    final curr_group = routeData;

    print("Current Page is " + curr_group);

    return MaterialApp(
      home: Scaffold(
        //drawer: NavigationDrawerWidget(),

        appBar: AppBar(
          // title: Text('CONTAINS DATA OF ALL GROUPS'),
          title: Text(curr_group),
          
          centerTitle: true,
          backgroundColor: Colors.green,
        ),

        // body of the screen
        body: Container(
            
        ),


      ), 
    
    );

  }
}