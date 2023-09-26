import 'package:carousel_slider/carousel_slider.dart';
import 'package:dream_sports_user/constants/const_list.dart';
import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/home/screen_turfstatus.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';

class HomeScreeen extends StatefulWidget {
  const HomeScreeen({super.key});

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  final CarouselController carouselController = CarouselController();
  int cindex = 0;
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              logocontainer(
                height: mediaquery.height * 0.10,
              ),
              sheight,
              Stack(
                children: [
                  InkWell(
                    onTap: () {},
                    child: CarouselSlider(
                        items: offerbanner
                            .map((item) => Image.network(
                                  item['imagepath'],
                                  fit: BoxFit.cover,
                                  width: mediaquery.width,
                                ))
                            .toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          autoPlayInterval: const Duration(seconds: 5),
                          onPageChanged: (index, reason) {
                            setState(() {
                              cindex = index;
                            });
                          },
                        )),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: offerbanner.asMap().entries.map(
                            (entry) {
                              return GestureDetector(
                                onTap: () =>
                                    carouselController.animateToPage(entry.key),
                                child: Container(
                                  width: cindex == entry.key ? 17 : 7,
                                  height: 7.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: cindex == entry.key
                                          ? homecolor
                                          : whiteback),
                                ),
                              );
                            },
                          ).toList()))
                ],
              ),
              sheight,
              sheight,
              SizedBox(
                height: mediaquery.height * 0.05,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 4,
                  ),
                  itemBuilder: (context, index) => catogarycontainer(
                      mediaquery.width * 0.3,
                      mediaquery.height * 0.10,
                      catogoryitem[index]),
                  itemCount: 5,
                ),
              ),
              sheight,
              sheight,
              sheight,
              fieldtext('Grounds Nearby You'),
              sheight,
              SizedBox(
                height: mediaquery.height * 0.30,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 4,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) =>
                                  TurfStatusScreen(index: index)));
                    },
                    child: groundcontainer(
                      width: mediaquery.width * 0.7,
                      height: mediaquery.height * 0.20,
                      url: imageurl[index],
                      turfname: turfname[index],
                      location: locations[index],
                    ),
                  ),
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
