import 'package:dream_sports_user/constants/const_list.dart';
import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/class/remove_glow.dart';
import 'package:dream_sports_user/screens/home/screen_turfstatus.dart';
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
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      TurfStatusScreen(index: index)));
                        },
                        child: spotlist(
                            index: index,
                            context: context,
                            height: meidaquery.height * 0.15,
                            width: meidaquery.width * 1,
                            imwidth: meidaquery.width * 0.3,
                            childtext: turfname[index],
                            location: locations[index],
                            url: imageurl[index]),
                      );
                    },
                    itemCount: turfname.length,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
