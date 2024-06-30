import 'package:flutter/material.dart';

class MatchContainer extends StatelessWidget {
  final String titleNumber;
  final String teamNames;
  final String typeNumber;
  final String ptsNumber;
  final String imageName;

  const MatchContainer({
    super.key,
    required this.titleNumber, //
    required this.teamNames,
    required this.typeNumber,
    required this.ptsNumber,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            // Align the stack horizontally centered
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // Center contents horizontally
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Image.asset(
                            imageName,
                          ),
                        ),
                        Text(
                          teamNames,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/img_1.png",
                    height: 25,
                    width: 25,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // Center contents horizontally
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        Image.asset(
                          "assets/team_images/img_9.png",
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "Liverpool",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
