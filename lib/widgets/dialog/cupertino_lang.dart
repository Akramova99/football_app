import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/main/login/logout_cubit.dart';

void showCupertinoLang(BuildContext context) {
  showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        final cubit = context.read<LogoutCubit>();
        return BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              return CupertinoAlertDialog(
                content: SizedBox(
                  height: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/intro_images/img_1.png",
                                height: 23,
                                width: 23,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Ru ",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/intro_images/pay_me.png",
                                height: 23,
                                width: 23,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Uz ",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      });
}
