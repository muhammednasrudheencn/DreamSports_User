// ignore_for_file: use_build_context_synchronously

import 'package:dream_sports_user/signup/screen_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

sendcode(BuildContext context, {required String phone}) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: '+91$phone',
    timeout: const Duration(seconds: 60),
    verificationCompleted: (PhoneAuthCredential credential) {},
    verificationFailed: (FirebaseAuthException e) {},
    codeSent: (String verificationId, int? resendToken) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => OtpScreen(
                    verify: verificationId,
                    phone: phone,
                  )));
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}

verifyotp(BuildContext context,
    {required String otp, required var verify, required Widget screen}) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  try {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verify, smsCode: otp);

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential);

    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (ctx) => screen), (route) => false);
    // ignore: empty_catches
  } catch (e) {}
}
