import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';



class PrefSection {
  static void saveSection(String section) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
Logger().i("saves success");
    await prefs.setString("section", section);
  }

  static Future<String?> getSection() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String section = prefs.getString("section")??"1-3-4-3";
    Logger().w(section);
  return section ;
  }
}
