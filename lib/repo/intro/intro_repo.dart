import 'package:dio/dio.dart';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/players_model/players_model.dart';
import '../../utils/network/network_info.dart';

class IntroRepo {
  final Dio client;
  final NetworkInfo networkInfo;

  IntroRepo({required this.client, required this.networkInfo});

  Future<List<PlayersModel>> getPlayers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final tokenJson = prefs.getString("registerToken");
    final res = await client.get("/api/v1/players",
        options: Options(headers: {"Authorization": "Bearer $tokenJson"}));
    Logger().i(res.statusCode);
    Logger().i(res.statusCode);

    var data =
        res.data.map((players) => PlayersModel.fromJson(players)).toList();
     Logger().i(data[0]);
    return data;
  }
}
