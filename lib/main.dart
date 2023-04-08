import 'package:flutter/material.dart';
import 'package:inturnship/init_providers.dart';
import 'package:inturnship/services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.initHive();
  runApp(const InitProviders());
}
