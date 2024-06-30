import 'package:flutter/material.dart';

import '../../../utils/list/rating_list.dart';
import '../../../widgets/container/rating_conatiner.dart';
import 'add_path_league.dart';

class PriseLeague extends StatelessWidget {
  const PriseLeague({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        title: const Text(
          "Sovrinli Ligalar",
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Color(0xff9D9D9D),
              borderRadius: BorderRadius.circular(20),
              border: Border(
                bottom: BorderSide(
                  width: 1,
                ),
              ),
            ),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/img.png"),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Rasm kiriting",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const RatingContainer(
            titleNumber: '#',
            teamNames: 'Uzb Cup',
            typeNumber: 'Shu Tur',
            ptsNumber: 'Hammasi',
            imageName: '',
            isMain: false,
            firstFour: false,
            secondTwo: false,
            thirdOne: false,
            isMine: false,
          ),
          _buildRatingContainer(ratingList),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              MaterialPageRoute(builder: (context) => AddPathLeague());
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
              ),
              height: 40,
              width: 150,
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Liga Ochish"),
                  ),
                  Icon(
                    Icons.add_circle,
                    color: Color(0xFF00B900),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildRatingContainer(List<Map<String, dynamic>> data) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
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
          thirdOne: isThirdOne,
          isMine: isMine,
        );
      },
    );
  }
}
