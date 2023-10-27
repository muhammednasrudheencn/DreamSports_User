import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:flutter/material.dart';

Widget messageinput(
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
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        prefixIcon: preicon,
        hintText: hint),
    controller: controller,
  );
}
