import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
const String baseUrl= "http://64.227.145.145:8080";
class TeamController {
  static Future<void> createTeam()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await Dio().post(
      '$baseUrl/api/v1/teams/create',
      options: Options(
          headers: {
            'accept': '*/*',
          }
      ),
    );
    Logger().i(response.data);
    await prefs.setString("createTeam", response.data.toString());
  }
}
Map mp ={520: 1, 1620: 2, 1621: 3, 1622: 4, 1623: 5, 2720: 0, 2721: 6, 2722: 7, 2723: 8, 2724: 9, 3820: 10};