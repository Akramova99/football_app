import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/main/login/logout_cubit.dart';

void showCupertinoAlertDialog(BuildContext context) {
  showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        final cubit = context.read<LogoutCubit>();
        return BlocBuilder(
            bloc: cubit,
            builder: (context,state){
          return CupertinoAlertDialog(
            title: const Row(
              children: [
                Expanded(
                  child: Text(
                    "Log out?  ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            content: const Text(
                "Bu qurilmadagi profilning barcha ma'lumotlarini o'chirib yuboradi. Davom ettirish? "),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Yo'q",style: TextStyle(fontSize: 16,color: Colors.black)),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  cubit.logoutPlatform();
                  Navigator.pop(context);
                },
                child: const Text(" Ha",style: TextStyle(fontSize: 16,color: Colors.red)),
              ),
            ],
          );
        });
      });
}
