import 'package:hive/hive.dart';
import 'package:inturnship/models/theme_box.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Future<void> initHive() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(ThemeBoxAdapter());
  }

  Future<Box<T>> openBox<T>(String boxName) async {
    return await Hive.openBox<T>(boxName);
  }

  Future<void> closeHive() async {
    await Hive.close();
  }
}
