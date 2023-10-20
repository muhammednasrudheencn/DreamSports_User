import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/home/screen_booking_detail.dart';
import 'package:dream_sports_user/services/firestore.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';

class TurfStatusScreen extends StatelessWidget {
  final int index;
  const TurfStatusScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: blackback,
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: headingtext(heading: 'Turf Status'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder(
            stream: store.collection('TurfOwner').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final document = snapshot.data!.docs[index];
              final data = document.data();
              return ListView(children: <Widget>[
                Column(
                  children: [
                    Stack(children: [
                      StreamBuilder(
                          stream: store
                              .collection('TurfOwner')
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
                            final banimg = snapshot1.data!.docs[0]['turfimage'];
                            return Container(
                              width: mediaquery.width * 1,
                              height: mediaquery.height * 0.22,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  image: DecorationImage(
                                      image: NetworkImage(banimg),
                                      fit: BoxFit.cover)),
                            );
                          }),
                      Center(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: mediaquery.height * 0.15),
                          child: const CircleAvatar(
                            backgroundColor: whiteback,
                            radius: 50,
                            child: CircleAvatar(
                              radius: 48,
                              backgroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnvQhgS3n1xorjtHK7wmZ17YSAGYy4-VzArA&usqp=CAU'),
                            ),
                          ),
                        ),
                      )
                    ]),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  data['courtname'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                Text(
                                  data['location'],
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 10,
                                  child: Image(
                                    image: NetworkImage(football),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: mediaquery.height * 0.05,
                                ),
                                button(
                                    context,
                                    'Book Now',
                                    homecolor,
                                    mediaquery.width * 0.5,
                                    mediaquery.height * 0.010,
                                    const BookingDetail(),
                                    1.0)
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ]);
            }),
      ),
    );
  }
}
