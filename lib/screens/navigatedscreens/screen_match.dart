import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/home/matchhost/screen_matchhost.dart';
import 'package:dream_sports_user/screens/home/tournamenthost/screen_tournement.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/const_list.dart';
import '../../widgets/screens_widget.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              logocontainer(height: mediaquery.height * 0.10),
              const SizedBox(height: 30),
              fieldtext('Matches Around You'),
              sheight,
              SizedBox(
                height: mediaquery.height * 0.20,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 4,
                  ),
                  itemBuilder: (context, index) => matches(
                      width: mediaquery.width * 0.7,
                      height: mediaquery.height * 0.4,
                      text: catogoryitem[index]),
                  itemCount: 2,
                ),
              ),
              sheight,
              sheight,
              SizedBox(
                width: mediaquery.width * 1,
                child: button2(
                    context: context,
                    screen: const MatchHostingScreen(),
                    childtext: 'Host Match',
                    height: mediaquery.height * 0.010,
                    width: mediaquery.width,
                    iconof: const Icon(Icons.sports)),
              ),
              const SizedBox(height: 30),
              fieldtext('Tournement Around You'),
              sheight,
              SizedBox(
                height: mediaquery.height * 0.20,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 4,
                  ),
                  itemBuilder: (context, index) => tournement(
                      width: mediaquery.width * 0.7,
                      height: mediaquery.height * 0.4,
                      text: catogoryitem[index]),
                  itemCount: 2,
                ),
              ),
              sheight,
              sheight,
              SizedBox(
                width: mediaquery.width * 1,
                child: button2(
                    context: context,
                    screen: const TournementHostSCreen(),
                    childtext: 'Host Tournament',
                    height: mediaquery.height * 0.010,
                    width: mediaquery.width,
                    iconof: const Icon(Icons.sports)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
