import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';



class PrefCaptain {

  static void saveCaptain(String captain) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Logger().i("saves success");
    await prefs.setString("captain", captain);
  }

  static Future<String?> getCaptain() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String captain = prefs.getString("captain")??"1-3-4-3";
    Logger().w(captain);
    return captain ;
  }
}
