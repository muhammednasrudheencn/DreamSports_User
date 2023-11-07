// ignore_for_file: must_be_immutable

import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/chatmessage/screen_chatinterface.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';

class MatchstsScreen extends StatelessWidget {
  final int index;
  final dynamic teamacatar;
  final String teamname;

  const MatchstsScreen({
    super.key,
    required this.index,
    required this.teamacatar,
    required this.teamname,
  });

  @override
  Widget build(BuildContext context) {
    final customsize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: blackback,
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: headingtext(heading: 'Match'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder(
            stream: store.collection('Matches').snapshots(),
            builder: (context, match) {
              if (match.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!match.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final matchinf = match.data!.docs[index];
              final matchdata = matchinf.data();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    Image.network(teamacatar).image,
                              ),
                              swidth,
                              fieldtext(teamname)
                            ],
                          ),
                          sheight,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              fieldtext(matchdata['game']),
                              const SizedBox(width: 4),
                              Text(
                                "(${matchdata['gametype']})",
                                style: const TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                          sheight,
                          sheight,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.date_range,
                                    size: 17,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    matchdata['date'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              swidth,
                              swidth,
                              swidth,
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 17,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    matchdata['location'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
                          fieldtext('Preference Ground'),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Ground : ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Text(
                                matchdata['ground'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  sheight,
                  button2(
                      childtext: 'Contact With User',
                      context: context,
                      height: customsize.height * 0.07,
                      width: customsize.width,
                      iconof: const Icon(Icons.chat),
                      screen: ChatInterface(
                          username: teamname,
                          profile: teamacatar,
                          reciverid: matchdata['userid']))
                ],
              );
            }),
      ),
    );
  }
}
