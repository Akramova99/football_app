import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';



class PrefPlacePlayers {
  static void savePlacePlayers(String playerName, int indexKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Logger().i("saves success");
    await prefs.setString(indexKey.toString(), playerName);
  }

  static Future<String?> getPlacePlayers(int indexKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String playerName = prefs.getString(indexKey.toString())??"Empty";
    Logger().w(playerName);
    return playerName ;
  }
}
