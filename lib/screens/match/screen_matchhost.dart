import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/inner_screens/screen_create_team.dart';
import 'package:dream_sports_user/screens/match/const.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';

class MatchHostingScreen extends StatelessWidget {
  const MatchHostingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> gametype = ValueNotifier('');
    ValueNotifier<String> gamelvl = ValueNotifier('');
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: homecolor,
          label: const Text(
            'Continue',
            style: TextStyle(fontSize: 15),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7))),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>));
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
            choosegame(
                cheight: mediaquery.height * 0.060,
                cwidth: mediaquery.width * 0.20,
                gametype: gametype),
            const SizedBox(height: 30),
            fieldtext('Choose Your Game Type'),
            const SizedBox(height: 30),
            choosegametype(
                gametype: gamelvl,
                cheight: mediaquery.height * 0.060,
                cwidth: mediaquery.width * 0.4),
            const SizedBox(height: 30),
            fieldtext('Choose Your Team'),
            const SizedBox(height: 30),
            Row(
              children: [
                Container(
                    height: mediaquery.height * 0.060,
                    width: mediaquery.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: StreamBuilder(
                        stream: store
                            .collection('User')
                            .doc(auth.currentUser!.uid)
                            .collection('Team')
                            .snapshots(),
                        builder: (context, team) {
                          if (team.connectionState == ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (!team.hasData) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (team.data!.docs.isNotEmpty) {
                            final teaminfo = team.data!.docs[0];
                            final teamdata = teaminfo.data();
                            return Container(
                              height: mediaquery.height * 0.06,
                              decoration: const BoxDecoration(
                                  color: whiteback,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    StreamBuilder(
                                        stream: store
                                            .collection('User')
                                            .doc(auth.currentUser!.uid)
                                            .collection('Team')
                                            .doc(auth.currentUser!.uid)
                                            .collection('teamavatar')
                                            .snapshots(),
                                        builder: (context, avatar) {
                                          if (avatar.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                          if (!avatar.hasData) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                          if (avatar.data!.docs.isEmpty) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          } else {
                                            final teamavatar =
                                                avatar.data!.docs[0]['avatar'];
                                            return teamavatar != null
                                                ? CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage:
                                                        Image.network(
                                                                teamavatar)
                                                            .image,
                                                  )
                                                : const CircleAvatar(
                                                    backgroundColor: whiteback,
                                                  );
                                          }
                                        }),
                                    const SizedBox(width: 5),
                                    fieldtext(teamdata['teamname'])
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Text("data");
                          }
                        })),
              ],
            ),
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
                mediaquery.height * 0.06, const CeateTeamScreen(), 1.0)
          ],
        ),
      ),
    );
  }
}
