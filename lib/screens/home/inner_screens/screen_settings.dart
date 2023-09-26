import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/services/firestore.dart';
import 'package:dream_sports_user/services/login_logout.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                logocontainer(height: mediaquery.height * 0.07),
                headingtext(heading: 'Settings'),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const SizedBox(child: Icon(Icons.logout)),
                TextButton(
                    onPressed: () {
                      logoutprocess(context);
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: blackback, fontSize: 20),
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }

  logoutprocess(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text("ARE YOU SURE"),
              content:
                  const Text('If you Tap On "Logout" Then Delete Your Account'),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text("Logout"),
                  onPressed: () {
                    deleteuser();
                    userlogout(context);
                  },
                ),
                CupertinoDialogAction(
                  child: const Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
