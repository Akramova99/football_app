import 'package:flutter/material.dart';

import '../utils/list/lists.dart';

class IntroPages extends StatelessWidget {
final  int index;

  const IntroPages({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            height:index==2?190: 200,
            carouselData[index]['image']!,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 50),
          Text(
            carouselData[index]['text']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              carouselData[index]['points']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
