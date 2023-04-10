import 'package:flutter/material.dart';
import 'package:inturnship/models/log_entry.dart';
import 'package:inturnship/services/hive/log_entry_service.dart';

class LogEntryProvider extends ChangeNotifier {
  final LogEntryService _logEntryService = LogEntryService();

  List<LogEntry> _logEntries = [];
  List<LogEntry> get logEntries => _logEntries;

  Future<void> getLogEntries() async {
    _logEntries = await _logEntryService.getLogEntries();

    notifyListeners();
  }

  Stream<List<LogEntry>> getLogEntriesStream() {
    return _logEntryService.getLogEntriesStream();
  }

  Future<void> addLogEntry({
    required LogEntry logEntry,
  }) async {
    await _logEntryService.addLogEntry(logEntry: logEntry);
  }

  Future<void> deleteLogEntry({
    required int id,
  }) async {
    await _logEntryService.deleteLogEntry(id: id);
  }

  Future<void> updateLogEntry({
    required int id,
    required LogEntry logEntry,
  }) async {
    await _logEntryService.updateLogEntry(id: id, logEntry: logEntry);
  }
}
