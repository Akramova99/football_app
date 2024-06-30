import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/main/login/logout_cubit.dart';

void showMaterialAlertDialogExample(BuildContext context) {
  final cubit = context.read<LogoutCubit>();
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              return AlertDialog(
                title: const SingleChildScrollView(
                  child: Row(
                    children: [

                      Expanded(
                        child: Text(
                          "Log out?  ",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                content: const Text(
                    "Bu qurilmadagi profilning barcha ma'lumotlarini o'chirib yuboradi. Davom ettirish? ",style: TextStyle(fontSize: 16),),
                actions: <Widget>[
                  TextButton(onPressed: () {
                    Navigator.pop(context);

                  }, child: const Text("Yo'q",style: TextStyle(fontSize: 16,color: Colors.black))),
                  TextButton(
                      onPressed: () {
                        cubit.logoutPlatform();
                        Navigator.pop(context);

                      },
                      child: const Text("Ha",style: TextStyle(fontSize: 16,color: Colors.red),)),
                ],
              );
            });
      });
}
