import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/chatmessage/screen_chatinterface.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteback,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: blackback,
            )),
        title: headingtext(heading: 'CHAT LIST'),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 250, 245, 245),
      body: SafeArea(
          child: StreamBuilder(
        stream: store
            .collection('chat_rooms')
            .where('roomusers', arrayContains: auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.docs.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final docu = snapshot.data!.docs[index];
                  final cht = docu.data();
                  final roomUsers = snapshot.data!.docs[index]['roomusers'];
                  String? targetuser;
                  for (int i = 0; i < 2; i++) {
                    if (roomUsers[i] != auth.currentUser!.uid) {
                      targetuser = roomUsers[i];
                    }
                  }
                  return StreamBuilder<DocumentSnapshot>(
                    stream: store
                        .collection('TurfDetails')
                        .doc(targetuser)
                        .snapshots(),
                    builder: (context, user) {
                      if (user.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (!user.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final data = user.data!.data() as Map<String, dynamic>;
                      return StreamBuilder(
                          stream: store
                              .collection('TurfDetails')
                              .doc(targetuser)
                              .collection('avatar')
                              .snapshots(),
                          builder: (context, profilepic) {
                            if (profilepic.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (!profilepic.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (profilepic.data!.docs.isNotEmpty) {
                              final pimage =
                                  profilepic.data!.docs[0]['turfavatar'];
                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => ChatInterface(
                                              username: data['courtname'],
                                              profile: pimage,
                                              reciverid: data['userid'])));
                                },
                                leading: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: Image.network(pimage).image,
                                ),
                                title: Text(data['courtname'],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(cht['lastmessage'],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                // trailing: Text('${cht['lasttime']}',
                                //     style: const TextStyle(
                                //         fontSize: 14,
                                //         fontWeight: FontWeight.bold)),
                              );
                            } else {
                              return const Text('No data');
                            }
                          });
                    },
                  );
                },
                itemCount: snapshot.data!.docs.length,
              ),
            );
          } else {
            return const Text('No data');
          }
        },
      )),
    );
  }
}
