import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/class/remove_glow.dart';
import 'package:dream_sports_user/screens/booking/screen_turfstatus.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';

class SpotScreen extends StatelessWidget {
  const SpotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meidaquery = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              searchfield(),
              sheight,
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: StreamBuilder(
                      stream: store.collection('TurfDetails').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final document = snapshot.data!.docs[index];
                            final data = document.data();

                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) =>
                                            TurfStatusScreen(index: index)));
                              },
                              child: StreamBuilder(
                                  stream: store
                                      .collection('TurfDetails')
                                      .doc(data['userid'])
                                      .collection('images')
                                      .snapshots(),
                                  builder: (context, snapshot1) {
                                    if (snapshot1.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    if (!snapshot1.hasData) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    final url =
                                        snapshot1.data!.docs[0]['turfimage'];
                                    return spotlist(
                                        index: index,
                                        context: context,
                                        height: meidaquery.height * 0.12,
                                        width: meidaquery.width * 1,
                                        imwidth: meidaquery.width * 0.4,
                                        childtext: data['courtname'],
                                        location: data['location'],
                                        url: url);
                                  }),
                            );
                          },
                          itemCount: snapshot.data!.docs.length,
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
