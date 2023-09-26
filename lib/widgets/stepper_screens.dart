import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/services/signup_otp.dart';
import 'package:dream_sports_user/signup/widget.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:flutter/material.dart';

Widget signup(context, TextEditingController phone) {
  final mediaquery = MediaQuery.of(context).size;
  return Scaffold(
    backgroundColor: Colors.grey[200],
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(logo),
              width: mediaquery.width * 0.3,
            ),
            Text('Start With Dream Sports',
                style: dreamtext(
                    fontSize: 15, letterSpacing: 3, color: blackback)),
            sheight,
            sheight,
            sheight,
            sheight,
            fieldtext('Phone Number'),
            sheight,
            phonefield(controller: phone),
            sheight,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: homecolor,
                  fixedSize:
                      Size(mediaquery.width * 1, mediaquery.height * 0.06)),
              onPressed: () {
                sendcode(context, phone: phone.text.trim());
              },
              child: const Text(
                'Send Code',
                style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
