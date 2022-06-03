import 'package:hive/hive.dart';
import 'package:people_management/model/group.dart';

class Boxes {

  // save the groups here
  static Box<group> getGroup() =>
      Hive.box<group>('group');
}