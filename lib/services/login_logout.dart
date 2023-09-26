// ignore_for_file: use_build_context_synchronously

import 'package:dream_sports_user/screens/home/navigated_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../signup/screen_signup.dart';

const savekey = 'user loging';

userlogincheck(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 3));

  final loginkey = await SharedPreferences.getInstance();
  final logincheck = loginkey.getBool(savekey);

  if (logincheck == false || logincheck == null) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => SignupScreen()));
  } else {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const NavigatedScreen()));
  }
}

userlogin(BuildContext context) async {
  final loginkey = await SharedPreferences.getInstance();
  await loginkey.setBool(savekey, true);
}

userlogout(BuildContext context) async {
  final loginkey = await SharedPreferences.getInstance();
  await loginkey.clear();
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (ctx) => SignupScreen()),
    (route) => false,
  );
}
