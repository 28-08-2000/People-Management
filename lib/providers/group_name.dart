import 'package:flutter/material.dart';

class Group extends ChangeNotifier {

  // count of groups and list of group names
  var _groupCount = 0;
  var _groupNames = [];

  // function to add new group
  void addGroup(String x) {
      _groupCount += 1;
      _groupNames.add(x);

  }

  // getter to get group names
  List get getGroupNames {
      return _groupNames;
  }
}
