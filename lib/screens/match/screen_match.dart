import 'package:dream_sports_user/constants/const_list.dart';
import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/match/screen_matchhost.dart';
import 'package:dream_sports_user/screens/tournament/screen_tournement.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                logocontainer(height: mediaquery.height * 0.10),
                const SizedBox(height: 30),
                fieldtext('Matches Around You'),
                sheight,
                StreamBuilder(
                    stream: store.collection('Matches').snapshots(),
                    builder: (context, match) {
                      if (match.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (!match.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (match.data!.docs.isNotEmpty) {
                        return SizedBox(
                          height: mediaquery.height * 0.20,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 4,
                            ),
                            itemBuilder: (context, index) {
                              final matchinfo = match.data!.docs[index];
                              final mdata = matchinfo.data();

                              return matches(
                                  teamname: mdata['teamname'],
                                  width: mediaquery.width * 0.7,
                                  height: mediaquery.height * 0.4,
                                  text: catogoryitem[index]);
                            },
                            itemCount: match.data!.docs.length,
                          ),
                        );
                      } else {
                        return Container(
                          width: mediaquery.width * 0.7,
                          height: mediaquery.height * 0.4,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7))),
                          child: const Center(child: Text('NO MATCHES')),
                        );
                      }
                    }),
                sheight,
                sheight,
                SizedBox(
                  width: mediaquery.width * 1,
                  child: button2(
                      context: context,
                      screen: MatchHostingScreen(),
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
      ),
    );
  }
}
