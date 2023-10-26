import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:flutter/material.dart';

void dreamsnackbar(BuildContext context, String childtext, bool issuccess) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(childtext),
    backgroundColor: issuccess ? homecolor : Colors.red,
    margin: const EdgeInsets.all(10),
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    closeIconColor: Colors.white,
    duration: const Duration(seconds: 2),
  ));
}
