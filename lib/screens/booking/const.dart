import 'package:flutter/material.dart';

Widget slotcontainer({BuildContext? context, var time, Color? color}) {
  final mediaquery = MediaQuery.of(context!).size;
  return Container(
    width: mediaquery.width * 0.20,
    height: mediaquery.height * 0.06,
    decoration: BoxDecoration(
        color: color!,
        borderRadius: const BorderRadius.all(Radius.circular(5))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
