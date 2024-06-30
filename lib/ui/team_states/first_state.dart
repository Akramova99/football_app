import 'package:flutter/material.dart';

import '../../service/hive_service/selection_section.dart';
import '../../utils/list/lists.dart';

class FirstState extends StatefulWidget {
  const FirstState({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FirstStateState();
  }
}

class _FirstStateState extends State<FirstState> {
  int _selectedIndex = 0;
  String s ='1-3-4-3';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }
//real



  void check()async {
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

  // get teamSection => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only(right: 20),
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
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  s,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        _buildStack(),
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
          child: Builder(builder: (context) {
            return Column(
              children: [
                Image.asset("assets/images/player.png"),
                Text(
                  "sa",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            );
          }),
        ),
      );
    }
    return linePositions;
  }

  void _onDropdownChanged(int? newIndex) {
    if (newIndex != null) {

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


}
