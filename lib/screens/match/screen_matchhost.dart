import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/navigatedscreens/navigated_screen.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:dream_sports_user/widgets/matchhost_widget.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';

class MatchHostingScreen extends StatelessWidget {
  const MatchHostingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: homecolor,
          icon: const Icon(Icons.sports),
          label: const Text(
            'Host Match',
            style: TextStyle(fontSize: 15),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7))),
          onPressed: () {
            Navigator.pop(context);
          }),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: blackback,
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: headingtext(heading: 'Host Match'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            fieldtext('Choose Your Game'),
            sheight,
            sheight,
            scrollwidget(
                height: mediaquery.height * 0.070,
                itemcount: 10,
                type: game(
                    height: mediaquery.height * 0.060,
                    width: mediaquery.width * 0.20)),
            const SizedBox(height: 30),
            fieldtext('Choose Your Game Type'),
            const SizedBox(height: 30),
            scrollwidget(
                height: mediaquery.height * 0.070,
                itemcount: 10,
                type: game(
                    height: mediaquery.height * 0.060,
                    width: mediaquery.width * 0.4)),
            const SizedBox(height: 30),
            fieldtext('Choose Your Team'),
            const SizedBox(height: 30),
            scrollwidget(
                height: mediaquery.height * 0.070,
                itemcount: 1,
                type: game(
                    height: mediaquery.height * 0.060,
                    width: mediaquery.width * 0.4)),
            sheight,
            const Row(children: <Widget>[
              Expanded(
                  child: Divider(
                thickness: 1,
                color: Colors.grey,
              )),
              Text("OR"),
              Expanded(
                  child: Divider(
                thickness: 1,
                color: Colors.grey,
              )),
            ]),
            sheight,
            sheight,
            button(context, 'Create New Team', homecolor, mediaquery.width * 1,
                mediaquery.height * 0.06, const NavigatedScreen(), 1.0)
          ],
        ),
      ),
    );
  }
}
