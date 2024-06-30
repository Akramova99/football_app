import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/models/players_model/players_model.dart';

class PlayerListCubit extends Cubit<List> {
  PlayerListCubit() : super([]);

  void playersList(List<PlayersModel> lst) {
    emit(lst);
  }
}
