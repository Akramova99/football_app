import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/first/selctionTeam/slection_team.dart';

class PlayerPref {
  // static Future<void> savePosition(Map<int, int> myMap) async {
  //   final prefs = await SharedPreferences.getInstance();
  //
  //   final String positionsString = json.encode(myMap);
  //   await prefs.setString('myMapKey', positionsString);
  // }
  //
  // static Future<Map<int, int>?> getPosition() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? jsonString = prefs.getString('myMapKey');
  //   if (jsonString != null) {
  //     // Decode the JSON string back to a map
  //     Map<int, int> myMap = jsonDecode(jsonString);
  //     // Use the map'
  //     Logger().i(myMap);
  //     return myMap;
  //   } else {
  //     // Handle the case where the map doesn't exist
  //     print(
  //         'Map not found in SharedPreferences+++++++++++++++++++++++++++++++++++++++');
  //   }
  //   return null;
  // }

  static Future<void> savePreferences(Map<int, int> preferences) async {
    final prefs = await SharedPreferences.getInstance();
    preferences.forEach((key, value) async {
      await prefs.setInt(key.toString(), value);
    });
  }

  static List<int> keys = [
    2721,
    2723,
    520,
    2722,
    2720,
    1620,
    1621,
    1622,
    1623,
    2724,
    3820,
    3821,
    3822,
    2724,
  ];

  static Future<Map<int, int>> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    Map<int, int> loadedPreferences = {};

   // for (String keyStr in prefs.getKeys()) {
    for (int keyStr in keys) {
      int key = 0;
      if (key != -1) {
        int value =prefs.getInt(keyStr.toString())??0 ;

        switch (keyStr) {
          case 2721:
            key = 6;///
            break;
          case 2723:
            key = 9;
            break;
          case 520:
            key = 0;
            break;
          case 2722:
            key = 7;// 2 ta 6
            break;
          case 2720:
            key = 5;
            break;
          case 1620:
            key = 1;
            break;
          case 1621:
            key = 2;
            break;
          case 1622:
            key = 3;
            break;
          case 1623:
            key = 4;
            break;
          case 2724:
            key = 8;//9
            break;
          case 3820:
            key = 9;
            break;
          case 3821:
            key = 10;
            break;
          case 3822:
            key = 6;
            break;
          default:
            continue;
        }
        loadedPreferences[key] = value;
      }
    }

    return loadedPreferences;
  }

  // Update the player list based on loaded preferences

}
