import 'package:flutter/material.dart';
import 'package:inturnship/app.dart';
import 'package:inturnship/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class InitProviders extends StatelessWidget {
  const InitProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()..initTheme()),
    ], child: const App());
  }
}
