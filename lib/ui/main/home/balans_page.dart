
import 'package:flutter/material.dart';

import '../../../utils/list/buttom_list2.dart';
import '../../../widgets/buttoms/buttom_widget2.dart';
import '../../../widgets/buttoms/drop_down.dart';

class BalansPage extends StatelessWidget {
  const BalansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Balans",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Text(
                  "Hisobimda: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "200 coin",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1FDE00),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            _buildButton(buttomData2),
            const DropDownWidget(
              text: 'Full paket',
              image: 'assets/images/rating.png',
              text2: '1000 coin',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(List<Map<String, dynamic>> data) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return ButtomWidget2(
          text: data[index]['text'],
          image: data[index]['image'],
          pressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => data[index]['navigation'],
              ),
            );
          },
          text2: data[index]['text2'],
        );
      },
    );
  }
}
