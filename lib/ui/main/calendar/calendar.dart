import 'package:flutter/material.dart';

import '../../../utils/list/rating_list.dart';
import '../../../widgets/container/rating_conatiner.dart';
import '../../other_pages/round_container.dart';

class CalendarPage extends StatelessWidget {
  static const String id = "Calendar";
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
             toolbarHeight: 100,
            backgroundColor: Colors.white10,
            elevation: 0,
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Taqvim',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TabBar(
                  labelStyle: TextStyle(fontSize: 16),
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(
                      text: "1-tur o'yinlari",
                    ),
                    Tab(
                      text: "2-tur o'yinlari",
                    ),
                    Tab(
                      text: "3-tur o'yinlari",
                    ),
                  ],
                  dividerHeight: 0,
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
               SizedBox(height: 260,child:  TabBarView(children: [
                 roundContainer(ratingList),
                 roundContainer(ratingList),
                 roundContainer(ratingList),

               ]),),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Umumiy Reyting",style: TextStyle(fontSize: 32),),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const RatingContainer(
                      titleNumber: '#',
                      teamNames: 'Jamoalar',
                      typeNumber: 'M   ',
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
                )
              ],
            ),
          ),
        ));
  }
  roundContainer(List<Map<String, dynamic>> data) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {

        return RoundContainer(
          titleNumber: data[index]['titleNumber'],
          teamNames: data[index]['teamNames'],
          typeNumber: data[index]['typeNumber'],
          ptsNumber: data[index]['ptsNumber'],
          imageName: data[index]['imageName'],

        );
      },
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
