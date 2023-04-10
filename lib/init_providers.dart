import 'package:flutter/material.dart';
import 'package:inturnship/app.dart';
import 'package:inturnship/providers/log_entry_provider.dart';
import 'package:inturnship/providers/profile_provider.dart';
import 'package:inturnship/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class InitProviders extends StatelessWidget {
  const InitProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          lazy: false, create: (_) => ThemeProvider()..initTheme()),
      ChangeNotifierProvider(lazy: false, create: (_) => ProfileProvider()),
      ChangeNotifierProvider(
          lazy: false, create: (_) => LogEntryProvider()..getLogEntries()),
    ], child: const App());
  }
}
