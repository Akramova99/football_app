import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_app/ui/main/league/prise_league.dart';

import '../../../utils/list/rating_list.dart';
import '../../../widgets/container/rating_conatiner.dart';

class AdditionalLeague extends StatefulWidget {
  const AdditionalLeague({super.key});

  @override
  State<AdditionalLeague> createState() => _AdditionalLeagueState();
}

class _AdditionalLeagueState extends State<AdditionalLeague> {
  double index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        title: const Text(
          "Qo'shimcha Ligalar",
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
              MaterialPageRoute(builder: (context) => PriseLeague());
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
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Qo'shimcha Liga Ochish"),
                  ),
                  Icon(
                    Icons.add_circle,
                    color: Color(0xFF00B900),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              "Liga Nomi",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Text(
              "Uzb Cup",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Row(
            children: [
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: Text(
                      "Min",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: Text(
                      "4.5\$",
                      style: TextStyle(fontSize: 12, color: Color(0xFF00B900)),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Slider(
                      max: 10,
                      min: 0,
                      activeColor: const Color(0xFF00B900),
                      value: index,
                      onChanged: (newIndex) {
                        setState(() {
                          index = newIndex;
                        });
                      })),
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20.0,
                    ),
                    child: Text(
                      "Max",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20.0,
                    ),
                    child: Text(
                      "9.5\$",
                      style: TextStyle(fontSize: 12, color: Color(0xFF00B900)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              MaterialPageRoute(builder: (context) => PriseLeague());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 20),
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
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Upload"),
                      ),
                      Icon(
                        CupertinoIcons.upload_circle_fill,
                        color: Color(0xFF00B900),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                MaterialPageRoute(builder: (context) => AdditionalLeague());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00B900),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "61DWKPEX03",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Icon(
                    Icons.copy,
                    color: Colors.white,
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
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        return RatingContainer(
          titleNumber: data[index]['titleNumber'],
          teamNames: data[index]['teamNames'],
          typeNumber: data[index]['typeNumber'],
          ptsNumber: data[index]['ptsNumber'],
          imageName: data[index]['imageName'],
          isMain: true,
          firstFour: false,
          secondTwo: false,
          thirdOne: false,
          isMine: false,
        );
      },
    );
  }
}
