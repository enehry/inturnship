import 'package:flutter/material.dart';
import 'package:inturnship/providers/theme_provider.dart';
import 'package:inturnship/utils/theme.dart';
import 'package:provider/provider.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.maxWidth = 250});

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Image.asset(
        context.watch<ThemeProvider>().currentTheme == darkTheme
            ? 'assets/logo/Inturnship-dark.png'
            : 'assets/logo/Inturnship-light.png',
      ),
    );
  }
}
