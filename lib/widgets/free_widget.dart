import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textfield1(
    {required TextEditingController controller,
    Icon? preicon,
    required String? hint,
    TextInputType? type,
    var length}) {
  return TextField(
    keyboardType: type,
    maxLength: length,
    decoration: InputDecoration(
        filled: true,
        fillColor: whiteback,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: whiteback),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: homecolor),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        prefixIcon: preicon,
        hintText: hint),
    controller: controller,
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
      style: TextStyle(
          letterSpacing: letterspace,
          fontSize: 15,
          fontWeight: FontWeight.bold),
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

Widget customappbar(
    {required BuildContext context, required String childtext}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      color: blackback,
      onPressed: () => Navigator.pop(context),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: headingtext(heading: 'TURF STATUS'),
    centerTitle: true,
  );
}

Widget oroption({var childtext}) {
  return Row(children: <Widget>[
    const Expanded(
        child: Divider(
      thickness: 1,
      color: Colors.grey,
    )),
    Text(childtext),
    const Expanded(
        child: Divider(
      thickness: 1,
      color: Colors.grey,
    )),
  ]);
}
