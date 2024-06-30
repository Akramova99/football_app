
import 'package:flutter/material.dart';

import '../../../utils/list/buttom_list.dart';
import '../../../widgets/buttoms/buttom_widget.dart';
import '../calendar/calendar.dart';
import '../settings/sozlamar_page.dart';
import 'balans_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Balans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Sozlamalar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF1FDE00),
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody() {
    return _selectedIndex == 0
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildButton(buttomData),
                ],
              ),
            ),
          )
        : _selectedIndex == 1
            ? const BalansPage()
            : const SettingScreen();
  }

  Widget _buildButton(List<Map<String, dynamic>> data) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return ButtomWidget(
          text: data[index]['text'],
          image: data[index]['image'],
          pressed: () {
            MaterialPageRoute(builder: (context) =>data[index]['navigation']);

          },
        );
      },
    );
  }
}
