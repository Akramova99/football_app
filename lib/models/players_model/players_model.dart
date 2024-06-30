class PlayersModel {
  int? playerNumber;
  int? id;
  String? name;
  String? position;

  PlayersModel({this.playerNumber, this.id, this.name, this.position});

  PlayersModel.fromJson(Map<String, dynamic> json) {
    playerNumber = json['player_number'];
    id = json['id'];
    name = json['name'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['player_number'] = playerNumber;
    data['id'] = id;
    data['name'] = name;
    data['position'] = position;
    return data;
  }
}
