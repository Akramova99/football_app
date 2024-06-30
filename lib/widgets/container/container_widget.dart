import 'package:flutter/material.dart';

class ContainerWithTriangleAndCopy extends StatefulWidget {
  const ContainerWithTriangleAndCopy({super.key});

  @override
  State<ContainerWithTriangleAndCopy> createState() =>
      _ContainerWithTriangleAndCopyState();
}

class _ContainerWithTriangleAndCopyState
    extends State<ContainerWithTriangleAndCopy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Baham ko'rish",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            Text(
              "Do’stlaringiz bilan baham ko’ring va ulashing",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xff05FF00))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Text(
                  "Havolani almashish",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                Icon(Icons.share),
              ]),
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Liga kodi",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            Text(
              "Ushbu havolani do'stlaringizga yuboring va ularni Ligaga taklif qiling",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xff05FF00))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Text(
                  "61DWKPEX03",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                Icon(Icons.file_copy),
              ]),
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Ligaga havola",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            Text(
              "Ushbu havolani do'stlaringizga yuboring va ularni Ligaga taklif qiling",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xff05FF00))),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Text(
                  "https://translate.google..",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                Icon(Icons.file_copy),
              ]),
            )
          ]),
        ),
      ],
    );
  }
}
