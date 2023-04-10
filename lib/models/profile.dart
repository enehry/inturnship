import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'hte.dart'; // import the HTE class or file

part 'profile.g.dart'; // generated file name

@HiveType(typeId: 2)
class Profile extends HiveObject {
  static const String boxName = 'profileBox';

  @HiveField(0)
  String id;

  @HiveField(1)
  String fullName;

  @HiveField(2)
  String homeAddress;

  @HiveField(3)
  String schoolCampus;

  @HiveField(4)
  String program;

  @HiveField(5)
  String yearSection;

  @HiveField(6)
  String adviser;

  @HiveField(7)
  Hte hte;

  @override
  String toString() {
    return 'Profile(id: $id, fullName: $fullName, homeAddress: $homeAddress, schoolCampus: $schoolCampus, yearSection: $yearSection, adviser: $adviser, hte: $hte)';
  }

  Profile({
    required this.fullName,
    required this.homeAddress,
    required this.schoolCampus,
    required this.yearSection,
    required this.program,
    required this.adviser,
    required this.hte,
  }) : id = const Uuid().v4();
}
