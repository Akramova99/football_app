import 'package:flutter/material.dart';

import '../../../widgets/container/container_widget.dart';

class SharePage extends StatelessWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.white10,
        title: const Text(
          "Do'stlarni taklif qilish",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return const Column(
      children: [
        ContainerWithTriangleAndCopy(),
      ],
    );
  }
}
