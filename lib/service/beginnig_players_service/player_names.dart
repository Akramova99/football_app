import 'package:shared_preferences/shared_preferences.dart';

class PlayerNames {
  static saveNames(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> lst = [];
    lst.add(name);
    await prefs.setStringList('items', lst);
  }

  static Future< List<String>?> getNames() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('items');
    return items;
  }
}
