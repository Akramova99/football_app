import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_app/ui/first/selctionTeam/slection_team.dart';

import '../../../service/hive_service/selection_section.dart';
import '../../../utils/list/lists.dart';

class MyTeam extends StatefulWidget {
  const MyTeam({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyTeamState();
  }
}

class _MyTeamState extends State<MyTeam> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  String s = "1-3-4-3";

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

  // get teamSection => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        title: const Text(
          'Mening Jamoam',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 10.0, bottom: 2),
          child: Row(
            children: [
              Text(
                "Jamoam   ",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Arsenal",
                style: TextStyle(fontSize: 16, color: Color(0xff29C126)),
              ),
              Image(
                image: AssetImage("assets/team_images/img_3.png"),
                height: 20,
                width: 20,
              )
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xff1F9059),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 8),
          width: 433,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  s,
                  style: TextStyle(fontSize: 20),
                ),
              )
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
          height: 115,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
                child: Column(
                  children: [
                    InkWell(
                      onTap: playerSelected[index]
                          ? null
                          : () {
                              setState(() {
                                if (currentSelectedPosition != null) {
                                  selectedPlayers[currentSelectedPosition!] =
                                      index;
                                  playerSelected[index] = true;
                                  currentSelectedPosition = null;
                                }
                              });
                            },
                      child: playerSelected[index]
                          ? Container(width: 0, height: 0) // Hide the image
                          : Image.asset("assets/images/player.png"),
                    ),
                    const SizedBox(height: 10),
                    playerSelected[index]
                        ? Container(width: 0, height: 0) // Hide the text
                        : Text(
                            playerList[index].name!,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                    const SizedBox(height: 6),
                    SvgPicture.asset(
                      "assets/images/reset.svg",
                      height: 16,
                      width: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, index) {
              return const SizedBox(width: 10);
            },
            itemCount: playerList.length,
          ),
        ),
        const SizedBox(height: 10),
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
                        playerList[selectedPlayers[positionKey]!].name!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/player.png"),
                      const Text(
                        "Nomi",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
          ),
        ),
      );
    }
    return linePositions;
  }

  void _onDropdownChanged(int? newIndex) {
    if (newIndex != null) {
      print("$newIndex ++++++++++++++++++++++++++++++++++++++++++++");

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
