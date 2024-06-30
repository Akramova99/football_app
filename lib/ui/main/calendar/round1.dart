import 'package:flutter/material.dart';

import '../../../utils/list/rating_list.dart';
import '../../other_pages/match.dart';
class RoundOfTeams extends StatelessWidget {
  const RoundOfTeams({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                margin: EdgeInsets.only(bottom: 20,left: 10,right: 10),
                decoration: BoxDecoration(
                  color:  Color(0xff9D9D9D),
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    bottom: BorderSide(
        
                      width: 1,
                    ),
                  ),
                ),
                height: 150,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
        
                    Image.asset("assets/images/img.png"),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("Rasm kiriting",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),

                  ],
                ),
              ),
              roundContainer(ratingList),
            ],
        ),
      ),
    );
  }
  roundContainer(List<Map<String, dynamic>> data) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {

        return MatchContainer(
          titleNumber: data[index]['titleNumber'],
          teamNames: data[index]['teamNames'],
          typeNumber: data[index]['typeNumber'],
          ptsNumber: data[index]['ptsNumber'],
          imageName: data[index]['imageName'],

        );
      },
    );
  }

}
