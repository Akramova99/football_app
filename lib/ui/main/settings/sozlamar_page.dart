import 'dart:io';


import 'package:flutter/material.dart';

import '../../../service/url_launcher_service.dart';
import '../../../utils/list/buttom_list3.dart';
import '../../../widgets/buttoms/buttom_widget.dart';
import '../../../widgets/dialog/cupertino_dialog.dart';
import '../../../widgets/dialog/cupertino_lang.dart';
import '../../../widgets/dialog/lang_material.dart';
import '../../../widgets/dialog/material_dialog.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "Sozlamalar",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (Platform.isAndroid) {
                showMaterialAlertDialogExample(context);
              } else if (Platform.isIOS) {
                showCupertinoAlertDialog(context);
              }
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
              size: 34,
            ),
          )
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (Platform.isAndroid) {
                      showMaterialAlertDialogLang(context);
                    } else if (Platform.isIOS) {
                      showCupertinoLang(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/translate.png',
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Tilini Tanlang',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildButton(buttomData3),
            const SizedBox(
              height: 31,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    await LaunchUrl.facebookCall();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/images/facebook.png'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    await LaunchUrl.twitterCall();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/images/twitter.png'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    await LaunchUrl.instagramCall();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/images/instagram.png'),
                  ),
                ),
              ],
            )
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
      itemBuilder: (BuildContext context, int index) {
        return ButtomWidget(
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
        );
      },
    );
  }
}
