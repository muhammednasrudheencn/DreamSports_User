import 'package:dream_sports_user/constants/const_list.dart';
import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/match/match_details.dart';
import 'package:dream_sports_user/screens/match/screen_matchhost.dart';
import 'package:dream_sports_user/screens/tournament/screen_tournement.dart';
import 'package:dream_sports_user/screens/tournament/tournament_sts.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> teamname = ValueNotifier('');
    ValueNotifier<String> game = ValueNotifier('');
    ValueNotifier<String> gametype = ValueNotifier('');
    ValueNotifier<String> date = ValueNotifier('');
    ValueNotifier<String> location = ValueNotifier('');
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
                          child: ValueListenableBuilder(
                            valueListenable: teamname,
                            builder: (context, value, child) {
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 4,
                                ),
                                itemBuilder: (context, index) {
                                  final matchinfo = match.data!.docs[index];
                                  final mdata = matchinfo.data();
                                  teamname.value = mdata['teamname'];
                                  game.value = mdata['teamname'];
                                  gametype.value = mdata['teamname'];
                                  date.value = mdata['teamname'];
                                  location.value = mdata['teamname'];
                                  return StreamBuilder(
                                      stream: store
                                          .collection('User')
                                          .doc(mdata['userid'])
                                          .collection('Team')
                                          .doc(mdata['userid'])
                                          .collection('teamavatar')
                                          .snapshots(),
                                      builder: (context, tavatar) {
                                        if (tavatar.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        if (!tavatar.hasData) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        final tmavatar =
                                            tavatar.data!.docs[0]['avatar'];

                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        MatchstsScreen(
                                                            index: index,
                                                            teamacatar:
                                                                tmavatar,
                                                            teamname: teamname
                                                                .value)));
                                          },
                                          child: matches(
                                              teamavatar: tmavatar,
                                              date: mdata['date'],
                                              location: mdata['location'],
                                              teamname: mdata['teamname'],
                                              width: mediaquery.width * 0.7,
                                              height: mediaquery.height * 0.4,
                                              text: catogoryitem[index]),
                                        );
                                      });
                                },
                                itemCount: match.data!.docs.length,
                              );
                            },
                          ),
                        );
                      } else {
                        return Container(
                          width: mediaquery.width * 0.7,
                          height: mediaquery.height * 0.2,
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
                StreamBuilder(
                    stream: store.collection('Tournaments').snapshots(),
                    builder: (context, tournament) {
                      if (tournament.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (!tournament.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (tournament.data!.docs.isNotEmpty) {
                        return SizedBox(
                          height: mediaquery.height * 0.20,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 4,
                            ),
                            itemBuilder: (context, index) {
                              final tourinfo = tournament.data!.docs[index];
                              final tdata = tourinfo.data();
                              return StreamBuilder(
                                  stream: store
                                      .collection('User')
                                      .doc(tdata['userid'])
                                      .collection('Team')
                                      .doc(tdata['userid'])
                                      .collection('teamavatar')
                                      .snapshots(),
                                  builder: (context, tavatar) {
                                    if (tavatar.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    if (!tavatar.hasData) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    final tmavatar =
                                        tavatar.data!.docs[0]['avatar'];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    TournementstsScreen(
                                                      index: index,
                                                      teamacatar: tmavatar,
                                                      teamname: teamname.value,
                                                    )));
                                      },
                                      child: tournement(
                                          width: mediaquery.width * 0.7,
                                          teamavatar: tmavatar,
                                          date: tdata['date'],
                                          age: tdata['agedemand'],
                                          game: tdata['game'],
                                          gametype: tdata['gametype'],
                                          location: tdata['location'],
                                          slotcount: tdata['slotcount'],
                                          height: mediaquery.height * 0.4,
                                          teamname: tdata['teamname']),
                                    );
                                  });
                            },
                            itemCount: tournament.data!.docs.length,
                          ),
                        );
                      } else {
                        return Container(
                          width: mediaquery.width * 0.7,
                          height: mediaquery.height * 0.2,
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
                      screen: TournementHostSCreen(),
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
