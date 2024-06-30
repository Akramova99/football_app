import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        title: const Text(
          "Bildirishnomalar",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity,
              height: 100,),
              Text("Hozircha Bildirishnomalar yo'q",style: TextStyle(fontSize: 20),),
              Icon(
                Icons.inbox,
                size: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
