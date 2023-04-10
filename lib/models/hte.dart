import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'hte.g.dart';

@HiveType(typeId: 1)
class Hte extends HiveObject {
  static const String boxName = 'hteBox';

  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String address;

  @HiveField(3)
  String contactNumber;

  @HiveField(4)
  int totalHours;

  @HiveField(5)
  int hoursPerDay;

  Hte({
    required this.name,
    required this.address,
    required this.contactNumber,
    required this.totalHours,
    required this.hoursPerDay,
  }) : id = const Uuid().v4();
}
