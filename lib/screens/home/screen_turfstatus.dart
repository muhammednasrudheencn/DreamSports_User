import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/home/screen_booking_detail.dart';
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
        child: Column(
          children: [
            Stack(children: [
              Container(
                width: mediaquery.width * 1,
                height: mediaquery.height * 0.22,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7aVmnK3sROW9rUU8JhHqhKFjgiUYScMSV6w&usqp=CAU'),
                        fit: BoxFit.cover)),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: mediaquery.height * 0.15),
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
                        const Text(
                          'Barcelona',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        const Text(
                          'Spain',
                          style: TextStyle(fontSize: 16),
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
      ),
    );
  }
}
