import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 2, adapterName: 'UserAdapter')
class User{
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? age;
  
  User({this.name, this.age});
}