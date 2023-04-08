import 'package:flutter/material.dart';
import 'package:inturnship/providers/theme_provider.dart';
import 'package:inturnship/utils/router.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_, themeProvider, __) => MaterialApp.router(
        title: 'Inturnship',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: themeProvider.currentTheme,
      ),
    );
  }
}
