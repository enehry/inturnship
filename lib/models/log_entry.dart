import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'log_entry.g.dart';

@HiveType(typeId: 3)
class LogEntry extends HiveObject {
  static String boxName = 'logEntryBox';

  @HiveField(0)
  String id;

  @HiveField(1)
  String summary;

  @HiveField(2)
  DateTime createdAt;

  @HiveField(3)
  String? remarks;

  @HiveField(4)
  DateTime timeIn;

  @HiveField(5)
  DateTime? timeOut;

  @override
  String toString() {
    return 'LogEntry{id: $id, summary: $summary, createdAt: $createdAt, remarks: $remarks, timeIn: $timeIn, timeOut: $timeOut}';
  }

  LogEntry({
    required this.summary,
    required this.createdAt,
    this.remarks,
    required this.timeIn,
    this.timeOut,
  }) : id = const Uuid().v4();
}
