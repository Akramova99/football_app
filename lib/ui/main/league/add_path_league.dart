import 'package:flutter/material.dart';

class AddPathLeague extends StatefulWidget {
  const AddPathLeague({super.key});

  @override
  State<AddPathLeague> createState() => _AddPathLeagueState();
}

class _AddPathLeagueState extends State<AddPathLeague> {
  TextEditingController pathController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[100],
              border: Border.all(color: const Color(0xff636363), width: 2),
            ),
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextField(
                controller: pathController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Silka Kiriting",
                    hintStyle: TextStyle(fontSize: 18)),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00B900),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Ligaga Qo'shilish",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        title: const Text(
          "Ligalarga Qo'shilish",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
