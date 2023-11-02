import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:flutter/material.dart';

Widget choosegame(
    {var cheight, var cwidth, required ValueNotifier<String> gametype}) {
  return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: ValueListenableBuilder(
        valueListenable: gametype,
        builder: (context, value, child) {
          return Row(
            children: [
              InkWell(
                  onTap: () {
                    gametype.value = 'Football';
                  },
                  child: game(
                      height: cheight,
                      width: cwidth,
                      gamet: 'Football',
                      gcolor: gametype.value == 'Football'
                          ? homecolor
                          : Colors.grey)),
              const SizedBox(width: 5),
              InkWell(
                  onTap: () {
                    gametype.value = 'Cricket';
                  },
                  child: game(
                      height: cheight,
                      width: cwidth,
                      gamet: 'Cricket',
                      gcolor: gametype.value == 'Cricket'
                          ? homecolor
                          : Colors.grey)),
              const SizedBox(width: 5),
              InkWell(
                  onTap: () {
                    gametype.value = 'Volley';
                  },
                  child: game(
                      height: cheight,
                      width: cwidth,
                      gamet: 'Volley',
                      gcolor: gametype.value == 'Volley'
                          ? homecolor
                          : Colors.grey)),
              const SizedBox(width: 5),
              InkWell(
                  onTap: () {
                    gametype.value = 'BasketBall';
                  },
                  child: game(
                      height: cheight,
                      width: cwidth,
                      gamet: 'BasketBall',
                      gcolor: gametype.value == 'BasketBall'
                          ? homecolor
                          : Colors.grey)),
              const SizedBox(width: 5),
              InkWell(
                  onTap: () {
                    gametype.value = 'Swimming';
                  },
                  child: game(
                      height: cheight,
                      width: cwidth,
                      gamet: 'Swimming',
                      gcolor: gametype.value == 'Swimming'
                          ? homecolor
                          : Colors.grey)),
            ],
          );
        },
      ));
}

Widget choosegametype(
    {var cheight, var cwidth, required ValueNotifier<String> gametype}) {
  return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: ValueListenableBuilder(
        valueListenable: gametype,
        builder: (context, value, child) {
          return Row(
            children: [
              InkWell(
                  onTap: () {
                    gametype.value = '3A Side';
                  },
                  child: game(
                      height: cheight,
                      width: cwidth,
                      gamet: '3A Side',
                      gcolor: gametype.value == '3A Side'
                          ? homecolor
                          : Colors.grey)),
              const SizedBox(width: 5),
              InkWell(
                  onTap: () {
                    gametype.value = '5A Side';
                  },
                  child: game(
                      height: cheight,
                      width: cwidth,
                      gamet: '5A Side',
                      gcolor: gametype.value == '5A Side'
                          ? homecolor
                          : Colors.grey)),
              const SizedBox(width: 5),
              InkWell(
                  onTap: () {
                    gametype.value = '6A Side';
                  },
                  child: game(
                      height: cheight,
                      width: cwidth,
                      gamet: '6A Side',
                      gcolor: gametype.value == '6A Side'
                          ? homecolor
                          : Colors.grey)),
              const SizedBox(width: 5),
              InkWell(
                  onTap: () {
                    gametype.value = '7A Side';
                  },
                  child: game(
                      height: cheight,
                      width: cwidth,
                      gamet: '7A Side',
                      gcolor: gametype.value == '7A Side'
                          ? homecolor
                          : Colors.grey)),
              const SizedBox(width: 5),
              InkWell(
                  onTap: () {
                    gametype.value = '9A Side';
                  },
                  child: game(
                      height: cheight,
                      width: cwidth,
                      gamet: '9A Side',
                      gcolor: gametype.value == '9A Side'
                          ? homecolor
                          : Colors.grey)),
              const SizedBox(width: 5),
              InkWell(
                  onTap: () {
                    gametype.value = '11A Side';
                  },
                  child: game(
                      height: cheight,
                      width: cwidth,
                      gamet: '11A Side',
                      gcolor: gametype.value == '11A Side'
                          ? homecolor
                          : Colors.grey)),
            ],
          );
        },
      ));
}

Widget game({var height, var width, String? gamet, Color? gcolor, String? g}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        border: Border.all(width: 1, color: gcolor!),
        color: g == 'Football' ? homecolor : whiteback),
    child: Center(
      child: Text(
        gamet!,
        style: TextStyle(fontWeight: FontWeight.w500, color: gcolor),
      ),
    ),
  );
}
