import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/ui/first/selctionTeam/player_state.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/players_model/players_model.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersInitial());

  Future<void> fetchPlayers() async {
    emit(PlayersLoading());
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
   //   String? token = prefs.getString("registerToken");
      String? token = prefs.getString("login");
      Logger().i(token);
      final response = await Dio().get(
        'http://64.227.145.145:8080/api/v1/players',
        options: Options(
            headers: {
             'accept': '*/*',
              //'Authorization': 'Bearer $token'
            }
        ),
      );

      final List<dynamic> data = response.data;
      final players = data.map((json) => PlayersModel.fromJson(json)).toList();

      emit(PlayersLoaded(players));
    } catch (e) {
      emit(PlayersError(e.toString()));
    }
  }
}