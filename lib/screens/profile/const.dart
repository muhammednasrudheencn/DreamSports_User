import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

snackbaronhelp({var width, var height, var toheight, var towidth}) {
  return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Help & Support',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            sheight,
            sheight,
            sheight,
            Text(
              'To get any help or support,then contact with\nDream Sports Support team',
              style: TextStyle(fontSize: 17),
            ),
            sheight,
            sheight,
            sheight,
            sheight,
            sheight,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Email : ',
                  style: TextStyle(fontSize: 17, color: homecolor),
                ),
                Text(
                  'dreamsportsapllication@gmail.com',
                  style: TextStyle(fontSize: 17, color: homecolor),
                ),
              ],
            ),
          ]));
}
