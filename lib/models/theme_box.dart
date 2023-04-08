import 'package:hive/hive.dart';

part 'theme_box.g.dart';

@HiveType(typeId: 0)
class ThemeBox extends HiveObject {
  static const String boxName = 'themeBox';

  @HiveField(0)
  bool isDark = false;

  ThemeBox({this.isDark = false});
}
