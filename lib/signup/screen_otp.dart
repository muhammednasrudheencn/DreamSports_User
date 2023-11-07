import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/navigatedscreens/navigated_screen.dart';
import 'package:dream_sports_user/screens/registering/screen_register.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
import 'package:dream_sports_user/services/login_logout.dart';
import 'package:dream_sports_user/services/signup_otp.dart';
import 'package:dream_sports_user/signup/screen_signup.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String verify;
  final String phone;
  const OtpScreen({super.key, required this.verify, required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 56,
        height: 60,
        textStyle: const TextStyle(
          fontSize: 22,
          color: blackback,
        ),
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.transparent),
        ));

    // final mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter OTP',
                style: TextStyle(fontSize: 35, letterSpacing: 1),
              ),
              sheight,
              sheight,
              Text(
                'Enter The Verification Code.\nSent To : ${widget.phone}',
                style: const TextStyle(fontSize: 14, letterSpacing: 2),
              ),
              const SizedBox(
                height: 40,
              ),

              Pinput(
                length: 6,
                showCursor: true,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!
                        .copyWith(border: Border.all(color: homecolor))),
                onChanged: (value) {
                  if (value.length == 6) {
                    if (auth.currentUser != null) {
                      verifyotp(context,
                          otp: value.trim(),
                          verify: widget.verify,
                          screen: const NavigatedScreen());
                      userlogin(context);
                    } else {
                      verifyotp(context,
                          otp: value.trim(),
                          verify: widget.verify,
                          screen: RegisterScreen(phone: widget.phone));
                    }
                  }
                },
              ),

              const SizedBox(
                height: 40,
              ),
              sheight,
              sheight,
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //       backgroundColor: homecolor,
              //       fixedSize:
              //           Size(mediaquery.width * 1, mediaquery.height * 0.05)),
              //   onPressed: () async {},
              //   child: const Text(
              //     'Verify',
              //     style:
              //         TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  navigatedtextbutton(context, 'Change Number', SignupScreen()),
                  TextButton(onPressed: () {}, child: const Text('Resend'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
