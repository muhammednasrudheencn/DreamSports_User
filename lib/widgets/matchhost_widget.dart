import 'package:flutter/material.dart';

Widget game({var height, int? index, var width}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        border: Border.all(width: 0.3),
        color: Colors.white),
  );
}
