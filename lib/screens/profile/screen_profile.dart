import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_sports_user/constants/const_list.dart';
import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/class/remove_glow.dart';
import 'package:dream_sports_user/screens/inner_screens/screen_create_team.dart';
import 'package:dream_sports_user/screens/inner_screens/screen_settings.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:flutter/material.dart';
import '../../widgets/screens_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('User')
                  .where("userid", isEqualTo: auth.currentUser!.uid)
                  .snapshots(),
              builder: (context, userdet) {
                if (userdet.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!userdet.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (userdet.data!.docs.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final document = userdet.data!.docs[0];
                  final data = document.data();
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          logocontainer(height: mediaquery.height * 0.10),
                          headingtext(heading: 'Profile'),
                        ],
                      ),
                      sheight,
                      sheight,
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StreamBuilder(
                                  stream: store
                                      .collection('User')
                                      .doc(data['userid'])
                                      .collection('profile')
                                      .snapshots(),
                                  builder: (context, userprofile) {
                                    if (userprofile.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    if (!userprofile.hasData) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    if (userprofile.data!.docs.isNotEmpty) {
                                      final profile = userprofile.data!.docs[0]
                                          ['Profileimg'];
                                      return CircleAvatar(
                                        radius: mediaquery.width * 0.12,
                                        backgroundImage: profile != null
                                            ? Image.network(profile).image
                                            : Image.asset(user).image,
                                      );
                                    } else {
                                      return const Text('No Data');
                                    }
                                  }),
                              swidth,
                              swidth,
                              swidth,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['name'],
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data['phone'],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      sheight,
                      sheight,
                      Text(
                        data['about'],
                        style: const TextStyle(fontSize: 15, letterSpacing: 1),
                      ),
                      const SizedBox(height: 30),
                      countingrow(),
                      const SizedBox(height: 30),
                      fieldtext('My Team'),
                      sheight,
                      Row(
                        children: [
                          button2(
                              width: mediaquery.width * 0.3,
                              height: mediaquery.height * 0.06,
                              screen: const CeateTeamScreen(),
                              childtext: 'Team',
                              iconof: const Icon(Icons.add),
                              context: context),
                          const SizedBox(width: 5),
                          StreamBuilder(
                              stream: store
                                  .collection('User')
                                  .doc(auth.currentUser!.uid)
                                  .collection('Team')
                                  .snapshots(),
                              builder: (context, team) {
                                if (team.connectionState ==
                                    ConnectionState.waiting) {
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7))),
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
                                                  final teamavatar = avatar
                                                      .data!.docs[0]['avatar'];
                                                  return teamavatar != null
                                                      ? CircleAvatar(
                                                          radius: 20,
                                                          backgroundImage:
                                                              Image.network(
                                                                      teamavatar)
                                                                  .image,
                                                        )
                                                      : const CircleAvatar(
                                                          backgroundColor:
                                                              whiteback,
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
                              })
                        ],
                      ),
                      sheight,
                      SizedBox(
                        width: mediaquery.width * 1,
                        height: mediaquery.height * 0.33,
                        child: ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  if (index == 3) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                const SettingsScreen()));
                                  }
                                },
                                title: Text(
                                  viewclass[index].childtext,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                leading: viewclass[index].prefixicon,
                                iconColor: blackback,
                              );
                            },
                            itemCount: viewclass.length,
                          ),
                        ),
                      )
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
