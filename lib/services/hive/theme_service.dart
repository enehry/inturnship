import 'package:inturnship/models/theme_box.dart';
import 'package:inturnship/services/hive_service.dart';

class ThemeService {
  final HiveService _hiveService = HiveService();

  Future<bool> getTheme() async {
    final box = await _hiveService.openBox<ThemeBox>(ThemeBox.boxName);
    final themeBox = box.get(0);
    if (themeBox == null) {
      await box.add(ThemeBox(isDark: false));
      return false;
    }
    return themeBox.isDark;
  }

  Future<void> toggleTheme() async {
    final box = await _hiveService.openBox<ThemeBox>(ThemeBox.boxName);
    final themeBox = box.get(0);
    if (themeBox == null) {
      await box.add(ThemeBox(isDark: true));
    } else {
      themeBox.isDark = !themeBox.isDark;
      await themeBox.save();
    }
  }

  Future<void> closeBoxes() async {
    await _hiveService.closeHive();
  }
}
