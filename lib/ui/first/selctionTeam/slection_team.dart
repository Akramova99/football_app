import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/models/players_model/players_model.dart';
import 'package:football_app/service/hive_service/place_players.dart';
import 'package:football_app/ui/first/selctionTeam/player_cubit.dart';
import 'package:football_app/ui/first/selctionTeam/player_state.dart';
import 'package:logger/logger.dart';

import '../../../service/beginnig_players_service/player_names.dart';
import '../../../service/beginnig_players_service/player_pref.dart';
import '../../../service/hive_service/selection_section.dart';
import '../../../utils/list/lists.dart';

List<PlayersModel> playerList = [];

class SelectionTeam extends StatefulWidget {
  const SelectionTeam({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SelectionTeamState();
  }
}

class _SelectionTeamState extends State<SelectionTeam> {
  int _selectedIndex = 0;

  // PlayersList playersList = Get.put(PlayersList());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
    get();
    loadPlayerPositions();
  }

  Future<void> loadPlayerPositions() async {
    final positions = await PlayerPref.loadPreferences();

    setState(() {
      selectedPlayers = positions;
      Logger().i(selectedPlayers);
      for (var index in positions.values) {
        playerSelected[index] = true;
      }
    });
  }

  Future<void> savePlayerPositions(Map<int, int> myMap) async {
    await PlayerPref.savePreferences(myMap);
  }

  // String s = SelectionSection.getSection() ?? "1-3-4-3";
  String s = "1-3-4-3";

  void get() async {
    final cubit = context.read<PlayersCubit>();
    await cubit.fetchPlayers();
  }

  void check() async {
    var team = await PrefSection.getSection();
    setState(() {
      s = team!;
      if (s == teamSection[1]) {
        _selectedIndex = 1;
      } else if (s == teamSection[2]) {
        _selectedIndex = 2;
      } else if (s == teamSection[3]) {
        _selectedIndex = 3;
      }
    });
  }

  List<bool> playerSelected = List.generate(11, (_) => false);
  Map<int, int> selectedPlayers = {};
  int? currentSelectedPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<PlayersCubit, PlayersState>(builder: (context, state) {
      if (state is PlayersInitial) {
        return Center(child: Text('Please wait...'));
      } else if (state is PlayersLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is PlayersLoaded) {
        return Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration(
                color: Color(0xff1F9059),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: 350,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Kamanda Tering",
                    style: TextStyle(fontSize: 20),
                  ),
                  buildDrop(context),
                ],
              ),
            ),
            _buildStack(),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 350,
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  context.read<PlayersCubit>();

                  final player = state.players[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 8),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: playerSelected[index]
                              ? null
                              : () {
                                  Logger().w(index);

                                  PlayerNames.saveNames(
                                      player.name!.split(' ').first);
                                  setState(() {
                                    playerList = state.players;
                                    if (currentSelectedPosition != null) {
                                      selectedPlayers[
                                          currentSelectedPosition!] = index;
                                      playerSelected[index] = true;
                                      Logger().d(selectedPlayers);
                                      savePlayerPositions(selectedPlayers);

                                      currentSelectedPosition = null;
                                    }
                                  });
                                },
                          child: playerSelected[index]
                              ? Container(width: 0, height: 0)
                              : Image.asset("assets/images/player.png"),
                        ),
                        const SizedBox(height: 10),
                        playerSelected[index]
                            ? Container(width: 0, height: 0)
                            : Text(
                                player.name ?? "",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(width: 10);
                },
                itemCount: 11,
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      } else if (state is PlayersError) {
        Logger().i(state.message);
        return Center(child: Text(state.message));
      }
      return Container();
    });
  }

  Widget _buildStack() {
    List<Widget> playerPositions = _getFormationPlayers();

    return Stack(
      children: [
        Image.asset(
          "assets/images/football_field.png",
          width: double.infinity,
        ),
        ...playerPositions,
      ],
    );
  }

  List<Widget> _getFormationPlayers() {
    List<Widget> formationPlayers = [];

    switch (_selectedIndex) {
      case 0:
        formationPlayers = _buildFormation(1, 3, 4, 3);
        break;
      case 1:
        formationPlayers = _buildFormation(1, 3, 5, 2);
        break;
      case 2:
        formationPlayers = _buildFormation(1, 4, 5, 1);
        break;
      case 3:
        formationPlayers = _buildFormation(1, 4, 4, 2);
        break;
    }

    return formationPlayers;
  }

  List<Widget> _buildFormation(
      int goalkeepers, int defenders, int midfielders, int forwards) {
    List<Widget> positions = [];
    double fieldWidth = MediaQuery.of(context).size.width;
    double fieldHeight = MediaQuery.of(context).size.height;
    double verticalSpacing = 110.0;

    positions.addAll(_buildLine(
        goalkeepers, fieldHeight / 2 - verticalSpacing * 3, fieldWidth - 15));
    positions.addAll(_buildLine(
        defenders, fieldHeight / 2 - verticalSpacing * 2, fieldWidth - 15));
    positions.addAll(_buildLine(
        midfielders, fieldHeight / 2 - verticalSpacing, fieldWidth - 15));
    positions.addAll(_buildLine(forwards, fieldHeight / 2, fieldWidth - 15));

    return positions;
  }

  List<Widget> _buildLine(
      int playerCount, double topOffset, double fieldWidth) {
    List<Widget> linePositions = [];
    double spacing = 70.0; // Adjusted spacing between players
    double leftOffset = (fieldWidth - (playerCount - 1) * spacing) / 2;

    for (int i = 0; i < playerCount; i++) {
      int positionKey = topOffset.toInt() * 10 + i;
      linePositions.add(
        Positioned(
            top: topOffset,
            left: leftOffset + (i * spacing),
            child: InkWell(
              onTap: () {
                setState(
                  () {
                    if (selectedPlayers.containsKey(positionKey)) {
                      int playerIndex = selectedPlayers[positionKey]!;
                      playerSelected[playerIndex] = false;

                      selectedPlayers.remove(positionKey);
                    } else {
                      currentSelectedPosition = positionKey;
                    }
                  },
                );
              },
              child: selectedPlayers.containsKey(positionKey)
                  ? Column(
                      children: [
                        Image.asset("assets/images/player.png"),
                        Text(
                          playerList[selectedPlayers[positionKey]!]
                              .name!
                              .split(' ')
                              .first,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  : Image.asset("assets/images/add_pleyer.png"),
            )),
      );
    }
    return linePositions;
  }

  void _onDropdownChanged(int? newIndex) {
    if (newIndex != null) {
      print("$newIndex ++++++++++++++++++++++++++++++++++++++++++++");
      PrefSection.saveSection(teamSection[newIndex]);

      setState(
        () {
          _selectedIndex = newIndex;
          selectedPlayers.clear();
          playerSelected = List.generate(11, (_) => false);
          currentSelectedPosition = null;
        },
      );
    }
  }

  Widget buildDrop(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff1F9059),
      ),
      height: 50,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: _selectedIndex,
          onChanged: _onDropdownChanged,
          items: [
            DropdownMenuItem<int>(
              value: 0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  teamSection[0],
                  style: TextStyle(fontSize: 20),
                )),
              ),
            ),
            DropdownMenuItem<int>(
              value: 1,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  teamSection[1],
                  style: TextStyle(fontSize: 20),
                )),
              ),
            ),
            DropdownMenuItem<int>(
              value: 2,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  teamSection[2],
                  style: TextStyle(fontSize: 20),
                )),
              ),
            ),
            DropdownMenuItem<int>(
              value: 3,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  teamSection[3],
                  style: TextStyle(fontSize: 20),
                )),
              ),
            ),
          ],
          hint: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text('Select Formation'),
            ),
          ),
          icon: const Icon(null),
        ),
      ),
    );
  }
}
