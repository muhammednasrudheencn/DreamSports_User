import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final customsize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              logocontainer(height: customsize.height * 0.10),
              headingtext(heading: 'Profile'),
            ],
          )
        ],
      ),
    );
  }
}
