
import 'package:flutter/material.dart';

import '../../utils/list/rating_list.dart';
import '../../widgets/container/rating_conatiner.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        title: const Text(
          'Reyting',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const RatingContainer(
            titleNumber: '#',
            teamNames: 'Jamoalar',
            typeNumber: 'Shu Tur',
            ptsNumber: 'PTS',
            imageName: '',
            isMain: false,
            firstFour: false,
            secondTwo: false,
            thirdOne: false,
            isMine: false,
          ),
          _buildRatingContainer(ratingList)
        ],
      ),
    );
  }

  _buildRatingContainer(List<Map<String, dynamic>> data) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        bool isFirstFour = index >= 0 && index <= 3;
        bool isSecondTwo = index == 4 || index == 5;
        bool isThirdOne = index == 6;
        bool isMine = index == 7;
        return RatingContainer(
          titleNumber: data[index]['titleNumber'],
          teamNames: data[index]['teamNames'],
          typeNumber: data[index]['typeNumber'],
          ptsNumber: data[index]['ptsNumber'],
          imageName: data[index]['imageName'],
          isMain: true,
          firstFour: isFirstFour,
          secondTwo: isSecondTwo,
          thirdOne: isThirdOne, isMine: isMine,
        );
      },
    );
  }
}