import 'package:dream_sports_user/blocs/bloc/splashbloc_bloc.dart';
import 'package:dream_sports_user/screens/navigatedscreens/navigated_screen.dart';
import 'package:dream_sports_user/signup/screen_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/const_variable.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return BlocListener<SplashblocBloc, SplashblocState>(
      listener: (context, state) {
        if (state is NavigateToHome) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => const NavigatedScreen()));
        } else if (state is NavigateToLogin) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => SignupScreen()));
        }
      },
      child: Scaffold(
        backgroundColor: homecolor,
        body: Center(
          child: Image(
            image: const AssetImage(logo),
            width: mediaquery.width * 0.6,
          ),
        ),
      ),
    );
  }
}
