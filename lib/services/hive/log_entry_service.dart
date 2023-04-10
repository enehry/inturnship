import 'package:inturnship/models/log_entry.dart';
import 'package:inturnship/services/hive_service.dart';

class LogEntryService {
  final HiveService _hiveService = HiveService();

  Future<int?> addLogEntry({
    required LogEntry logEntry,
  }) async {
    try {
      final box = await _hiveService.openBox<LogEntry>(LogEntry.boxName);
      var res = await box.add(logEntry);
      return res;
    } catch (e) {
      return null;
    }
  }

  Stream<List<LogEntry>> getLogEntriesStream() async* {
    final box = await _hiveService.openBox<LogEntry>(LogEntry.boxName);

    // check if box is empty
    if (box.isEmpty) {
      yield [];
    }

    // check if there is a new or update data was added to the box
    yield box.values.toList();
    await for (var _ in box.watch()) {
      yield box.values.toList();
    }
  }

  Future<List<LogEntry>> getLogEntries() async {
    final box = await _hiveService.openBox<LogEntry>(LogEntry.boxName);
    // check if box is empty
    if (box.isEmpty) {
      return [];
    }
    final logEntries = box.values.toList();
    return logEntries;
  }

  Future<int?> deleteLogEntry({
    required int id,
  }) async {
    final box = await _hiveService.openBox<LogEntry>(LogEntry.boxName);
    final logEntry = box.get(id);

    if (logEntry == null) {
      return null;
    }

    await logEntry.delete();

    return id;
  }

  Future<int?> updateLogEntry({
    required int id,
    required LogEntry logEntry,
  }) async {
    final box = await _hiveService.openBox<LogEntry>(LogEntry.boxName);
    final boxLogEntry = box.get(id);

    if (boxLogEntry == null) {
      return null;
    }

    boxLogEntry.remarks = logEntry.remarks;
    boxLogEntry.summary = logEntry.summary;
    boxLogEntry.createdAt = logEntry.createdAt;
    boxLogEntry.timeIn = logEntry.timeIn;
    boxLogEntry.timeOut = logEntry.timeOut;

    await logEntry.save();
    return id;
  }
}
