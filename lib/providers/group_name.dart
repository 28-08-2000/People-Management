import 'package:flutter/material.dart';

class Group extends ChangeNotifier {

  // count of groups and list of group names
  var _groupCount = 0;
  var _groupNames = [];

  // getter 
  int get groupCount => _groupCount;
  List get groupNames => _groupNames;

  // function to add new group
  void addGroup(String x) {
      _groupCount += 1;
      _groupNames.add(x);

      notifyListeners();
  }
  
}
