import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textfield(
    {Icon? iconof, var length, var hint, Widget? type, var controller}) {
  return TextFormField(
    decoration: InputDecoration(prefixIcon: iconof, labelText: hint),
    controller: controller,
    inputFormatters: [
      LengthLimitingTextInputFormatter(length),
    ],
  );
}

Widget button(
  BuildContext context,
  String childtext,
  Color colorof,
  var width,
  var height,
  Widget onpressscreen,
  var letterspace,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: colorof, fixedSize: Size(width, height)),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => onpressscreen));
    },
    child: Text(
      childtext,
      style: TextStyle(letterSpacing: letterspace, fontWeight: FontWeight.bold),
    ),
  );
}

Widget otpfield() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      SizedBox(
        height: 50,
        width: 50,
        child: TextField(
          textAlign: TextAlign.center,
          showCursor: false,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
      SizedBox(
        height: 50,
        width: 50,
        child: TextField(
          textAlign: TextAlign.center,
          showCursor: false,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
      SizedBox(
        height: 50,
        width: 50,
        child: TextField(
          textAlign: TextAlign.center,
          showCursor: false,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
      SizedBox(
        height: 50,
        width: 50,
        child: TextField(
          textAlign: TextAlign.center,
          showCursor: false,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    ],
  );
}

Widget navigatedtextbutton(
  BuildContext context,
  childtext,
  Widget screen,
) {
  return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => screen));
      },
      child: Text(childtext));
}

Widget fieldtext(String childtext) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(childtext,
        style: const TextStyle(
            color: blackback,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1)),
  );
}

Widget gendercontainer({
  var width,
  var height,
  var color,
  required childtext,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      border: Border.all(color: blackback),
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(7)),
    ),
    child: Center(
      child: Text(
        childtext,
        style: const TextStyle(
            fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.w900),
      ),
    ),
  );
}

Widget scrollwidget({var height, Widget? type, var itemcount}) {
  return SizedBox(
    height: height,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(
        width: 4,
      ),
      itemBuilder: (context, index) => type,
      itemCount: itemcount,
    ),
  );
}

imgbottom({var width, var height, var toheight, var towidth}) {
  return Container(
    width: width,
    height: height,
    margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pick Yor Time',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(height: 10),
      ],
    ),
  );
}
