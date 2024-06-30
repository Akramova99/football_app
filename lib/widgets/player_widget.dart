import 'package:flutter/material.dart';
import 'package:football_app/ui/first/selctionTeam/slection_team.dart';

import '../utils/list/lists.dart';

class Player extends StatelessWidget {

  Player(
      {super.key,
      required this.onPress,
      required this.index}); 

  final VoidCallback onPress; 
  final int index; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPress, 
          child:CircleAvatar(
                backgroundColor:
              //      selected.select.value ? Colors.green : Colors.transparent,
                Colors.green,
              child: Image.asset("assets/images/player.png"),
              ),
        ),
        Text(
          playerList[index].name!,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
