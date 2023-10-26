import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/chatmessage/screen_chat.dart';
import 'package:dream_sports_user/screens/homes/screen_home.dart';
import 'package:dream_sports_user/screens/match/screen_match.dart';
import 'package:dream_sports_user/screens/profile/screen_profile.dart';
import 'package:dream_sports_user/screens/navigatedscreens/screen_spot.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavigatedScreen extends StatefulWidget {
  const NavigatedScreen({super.key});

  @override
  State<NavigatedScreen> createState() => _NavigatedScreenState();
}

final screens = [
  const HomeScreeen(),
  const SpotScreen(),
  const MatchScreen(),
  const ChatScreen(),
  const ProfileScreen()
];
int selection = 0;
bool image = false;

class _NavigatedScreenState extends State<NavigatedScreen> {
  @override
  Widget build(BuildContext context) {
    //final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: screens[selection],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
            onTabChange: (value) async {
              setState(() {
                selection = value;
              });
            },
            gap: 8,
            activeColor: whiteback,
            tabBackgroundColor: blackback,
            padding: const EdgeInsets.all(10),
            tabs: const [
              GButton(icon: Icons.home_outlined, text: 'Home'),
              GButton(icon: Icons.stadium_outlined, text: 'Spot'),
              GButton(icon: Icons.width_wide_rounded, text: 'Match'),
              GButton(icon: Icons.chat, text: 'Chat'),
              GButton(icon: Icons.person, text: 'Profile')
            ]),
      ),
    );
  }
}
