import 'package:flutter/material.dart';

import '../../widgets/team_widget.dart';
import '../main/home/home_page.dart';
import '../main/login/login_page.dart';

class AssembleTeam extends StatefulWidget {
  const AssembleTeam({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AssembleTeamState();
  }
}

class _AssembleTeamState extends State<AssembleTeam> {
  String selectedTeamName = "Jamoani nomi";
  int teamNumber =0;

  void onTeamSelected(int index) {
    setState(() {
      selectedTeamName = "Team ${index + 1}"; // Example team name, modify as needed
      teamNumber = index;
    });
    print("Team $index selected"); // Print to console for debugging
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Text(
            "Jamoani tanlang",
            style: TextStyle(fontSize: 25),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 370,
              child: GridView.count(
                crossAxisCount: 5,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: List.generate(17, (index) {
                  return GestureDetector(
                    onTap: () => onTeamSelected(index),
                    child: TeamWidget(index: index),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0, right: 40, left: 40),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage(),),);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE7E7E7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedTeamName,
                      style: const TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w300),
                    ),
                     TeamWidget(index: teamNumber), // Display a static widget, if necessary
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),),);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00B900),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Ro'yhatdan o'tish",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),),);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00B900),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Mehmon bo'lib kirish",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
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