import 'package:flutter/material.dart';
import 'package:inturnship/services/hive/theme_service.dart';
import 'package:inturnship/utils/theme.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeService _themeService = ThemeService();

  ThemeProvider() {
    initTheme();
  }

  ThemeData _currentTheme = lightTheme;

  ThemeData get currentTheme => _currentTheme;

  Future<void> toggleTheme() async {
    _currentTheme = _currentTheme == lightTheme ? darkTheme : lightTheme;
    await _themeService.toggleTheme();
    notifyListeners();
  }

  Future<void> initTheme() async {
    final isDark = await _themeService.getTheme();
    _currentTheme = isDark ? darkTheme : lightTheme;
    notifyListeners();
  }

  @override
  void dispose() {
    _themeService.closeBoxes();
    super.dispose();
  }
}
