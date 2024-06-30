import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';



class PrefTeamName {
  static void saveTeamName(String teamName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Logger().i("saves success");
    await prefs.setString("teamName", teamName);
  }

  static Future<String?> getTeamName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String teamName = prefs.getString("teamName")??"1-3-4-3";
    Logger().w(teamName);
    return teamName ;
  }
}
