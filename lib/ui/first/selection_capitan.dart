import 'package:flutter/material.dart';
import 'package:football_app/repo/intro/team_controller.dart';
import 'package:football_app/service/beginnig_players_service/player_names.dart';
import 'package:football_app/ui/first/selctionTeam/slection_team.dart';
import 'package:logger/logger.dart';

import '../../service/beginnig_players_service/player_pref.dart';
import '../../service/hive_service/selection_section.dart';
import '../../utils/list/lists.dart';

class SelectionCaptain extends StatefulWidget {
  const SelectionCaptain({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SelectionCaptainState();
  }
}

class _SelectionCaptainState extends State<SelectionCaptain> {
  int _selectedIndex = 0;
  String formation = '1-3-4-3';

  int? selectedCaptainIndex;
  List<String> playerName = [];

  @override
  void initState() {
    super.initState();
    _loadFormation();
    getPosition();
    // getNames();
  }

  getNames() async {
    List<String>? list = await PlayerNames.getNames();
    setState(() {
      playerName = list!;
    });
  }

  getPosition() async {
    await TeamController.createTeam();
    var position = await PlayerPref.loadPreferences();
    Logger().e(position);
    return position;
  }

  void _loadFormation() async {
    Logger().w(PrefSection.getSection());
    var team = await PrefSection.getSection();
    setState(() {
      formation = team!;
      if (formation == teamSection[1]) {
        _selectedIndex = 1;
      } else if (formation == teamSection[2]) {
        _selectedIndex = 2;
      } else if (formation == teamSection[3]) {
        _selectedIndex = 3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
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
                "Select Captain",
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  formation,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        _buildStack(),
        if (selectedCaptainIndex != null)
          _buildCaptainInfo(selectedCaptainIndex!),
      ],
    );
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

    positions.addAll(_buildLine(goalkeepers,
        fieldHeight / 2 - verticalSpacing * 3, fieldWidth - 50, 0));
    positions.addAll(_buildLine(defenders,
        fieldHeight / 2 - verticalSpacing * 2, fieldWidth - 35, goalkeepers));
    positions.addAll(_buildLine(midfielders, fieldHeight / 2 - verticalSpacing,
        fieldWidth - 35, goalkeepers + defenders));
    positions.addAll(_buildLine(forwards, fieldHeight / 2, fieldWidth - 50,
        goalkeepers + defenders + midfielders));

    return positions;
  }

  List<Widget> _buildLine(
      int playerCount, double topOffset, double fieldWidth, int startIndex) {
    List<Widget> linePositions = [];
    double spacing = 70.0; // Adjusted spacing between players
    double leftOffset = (fieldWidth - (playerCount - 1) * spacing) / 2;

    for (int i = 0; i < playerCount; i++) {
      int index = startIndex + i;
      linePositions.add(
        Positioned(
          top: topOffset,
          left: leftOffset + (i * spacing),
          child: GestureDetector(
            onTap: () => _selectCaptain(index),
            child: Column(
              children: [
                Image.asset("assets/images/player.png"),
                Text(
                  playerList.isNotEmpty
                      ? playerList[index].name!.split(' ').first
                      : "",
                  // playerName[i] ,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return linePositions;
  }

  void _selectCaptain(int index) {
    setState(() {
      selectedCaptainIndex = index;
    });
  }

  void index() {
    int playerIndex = 0;
    switch (playerIndex) {
      case 2721:
    }
  }

  Widget _buildCaptainInfo(int captainIndex) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Captain: ${playerList[captainIndex].name}",
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
