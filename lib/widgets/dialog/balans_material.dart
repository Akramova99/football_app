import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/main/login/logout_cubit.dart';

void balansDialog(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hisobingizni To'ldiring!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[100],
                        border: Border.all(
                            color: const Color(0xff636363), width: 2),
                      ),
                      child: Text("Summani kiriting",
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff00B900),

                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("To'ldirish",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ),
                  ],
                ),
                actions: <Widget>[
                  Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/images/pay_me.png",
                                width: 100,
                                height: 100,
                              )),
                          InkWell(
                              onTap: () {},
                              child: Image.asset("assets/images/pay_me.png",
                                  width: 100, height: 100)),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text("FAQ on Privacy Policies",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      )
                    ],
                  )
                ],
              );
            });
      });
}
