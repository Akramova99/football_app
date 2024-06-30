import 'package:flutter/material.dart';

class TeamWidget extends StatelessWidget {
  final int index;

  const TeamWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/team_images/img_$index.png"),
      width: 30,
      height: 30,
    );
  }
}
