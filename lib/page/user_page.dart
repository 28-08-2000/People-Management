import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String name;
  final String urlImage;

  const UserPage({
    Key?key,
    required this.name,
    required this.urlImage,
}) : super(key : key);

  @override
  Widget build(BuildContext context) => Scaffold(

    // app bar of this page
    appBar: AppBar(
      backgroundColor: Colors.pinkAccent,
      title: Text(name),
      centerTitle: true,
    ),

    // body of the page
    body: Image.network(
      urlImage,
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    ),
  );

}