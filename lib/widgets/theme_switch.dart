import 'package:flutter/material.dart';
import 'package:inturnship/providers/theme_provider.dart';
import 'package:inturnship/utils/theme.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_, themeProvider, __) => Switch(
        value: themeProvider.currentTheme == darkTheme,
        onChanged: (_) {
          themeProvider.toggleTheme();
        },
      ),
    );
  }
}
