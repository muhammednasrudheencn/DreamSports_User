import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_sports_user/constants/const_list.dart';
import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/class/remove_glow.dart';
import 'package:dream_sports_user/screens/home/inner_screens/screen_settings.dart';
import 'package:dream_sports_user/services/firestore.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:flutter/material.dart';
import '../../widgets/screens_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('User')
                .where("userid", isEqualTo: auth.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final document = snapshot.data!.docs[0];
              final data = document.data();
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      logocontainer(height: mediaquery.height * 0.07),
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
                          CircleAvatar(
                            radius: mediaquery.width * 0.12,
                          ),
                          swidth,
                          swidth,
                          swidth,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['name'],
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
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
                      button2(childtext: 'Team', iconof: const Icon(Icons.add)),
                    ],
                  ),
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
                                  fontSize: 18, fontWeight: FontWeight.w500),
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
            },
          ),
        ),
      ),
    );
  }
}
