import 'package:hive/hive.dart';

part 'group.g.dart';

@HiveType(typeId: 0)
class group extends HiveObject{
  @HiveField(0)
  late String name;

  @HiveField(1)
  late DateTime createdDate;

  @HiveField(2)
  late bool isActive = false;
}