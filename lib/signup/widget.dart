import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

Widget phonefield({required var controller}) {
  return IntlPhoneField(
    decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: whiteback),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: homecolor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        filled: true,
        fillColor: whiteback,
        hintText: 'Phone Number'),
    initialCountryCode: 'IN',
    controller: controller,
    showCountryFlag: true,
  );
}
