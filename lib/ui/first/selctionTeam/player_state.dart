
import '../../../models/players_model/players_model.dart';

abstract class PlayersState {}

class PlayersInitial extends PlayersState {}

class PlayersLoading extends PlayersState {}

class PlayersLoaded extends PlayersState {
  final List<PlayersModel> players;

  PlayersLoaded(this.players);
}

class PlayersError extends PlayersState {
  final String message;

  PlayersError(this.message);
}