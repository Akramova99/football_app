import 'package:flutter/material.dart';

import '../../ui/main/calendar/round1.dart';

class RatingContainer extends StatelessWidget {
  final bool isMine;
  final bool isMain;
  final bool firstFour;
  final bool secondTwo;
  final bool thirdOne;
  final String titleNumber;
  final String teamNames;
  final String typeNumber;
  final String ptsNumber;
  final String imageName;

  const RatingContainer({
    super.key,
    required this.titleNumber,//
    required this.teamNames,
    required this.typeNumber,
    required this.ptsNumber,
    required this.imageName,
    required this.isMain,
    required this.firstFour,
    required this.secondTwo,
    required this.thirdOne,
    required this.isMine,
  });

@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      children: [
        GestureDetector(
          onTap: (){
            print("+++++++++++++++++++++++++++++++++bosildi");
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const RoundOfTeams(),),);

          },
          child: Stack(
            alignment: Alignment.center, // Align the stack horizontally centered
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
                mainAxisAlignment: MainAxisAlignment.center, // Center contents horizontally
                children: [
                  if (firstFour)
                    Image.asset(
                      'assets/images/lineBlue.png',
                    ),
                  if (secondTwo)
                    Image.asset(
                      'assets/images/linePurple.png',
                    ),
                  if (thirdOne)
                    Image.asset(
                      'assets/images/lineGreen.png',
                    ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    titleNumber,
                    style: TextStyle(
                      fontSize: 16,
                      color: isMain ? Colors.black : Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  isMain
                      ? Image.asset(
                          imageName,
                        )
                      : const SizedBox(),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    teamNames,
                    style: TextStyle(
                      fontSize: 16,
                      color: isMain ? Colors.black : Colors.grey,
                    ),
                  ),
                  Expanded(child: Container()), // Spacer to push text to the left and right
                ],
              ),
              isMain
                  ? Positioned(
                      right: 155,
                      child: Text(
                        typeNumber,
                        style: TextStyle(
                          fontSize: 16,
                          color: isMain ? Colors.black : Colors.grey,
                        ),
                      ),
                    )
                  : Positioned(
                      right: 140,
                      child: Text(
                        typeNumber,
                        style: TextStyle(
                          fontSize: 16,
                          color: isMain ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      ptsNumber,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

}
