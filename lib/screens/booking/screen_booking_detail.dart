// ignore_for_file: unrelated_type_equality_checks

import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/booking/const.dart';
import 'package:dream_sports_user/screens/payment/screen_payment.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingDetail extends StatefulWidget {
  final int index;
  const BookingDetail({super.key, required this.index});

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

ValueNotifier<String> strttime = ValueNotifier('');
ValueNotifier<String> endtime = ValueNotifier('');
ValueNotifier<String> turfname = ValueNotifier('');
ValueNotifier<String> location = ValueNotifier('');
String tdate = DateFormat("dd MMMM yyyy").format(DateTime.now());

class _BookingDetailState extends State<BookingDetail> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: store.collection('TurfDetails').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final document = snapshot.data!.docs[widget.index];
          final data = document.data();
          return Scaffold(
              backgroundColor: mainhome,
              floatingActionButton: FloatingActionButton.extended(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                backgroundColor: homecolor,
                onPressed: () {
                  datacheck(userid: data['userid']);
                },
                label: Row(
                  children: [
                    const Text(
                      'BOOK TURF',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(width: mediaquery.width * 0.5),
                    const Icon(Icons.arrow_forward)
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: blackback,
                  onPressed: () => Navigator.pop(context),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: headingtext(heading: 'BOOK TURF'),
                centerTitle: true,
              ),
              body: SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: StreamBuilder(
                            stream: store
                                .collection('TurfDetails')
                                .doc(data['userid'])
                                .collection('BookedSlots')
                                .snapshots(),
                            builder: (context, snapshot2) {
                              if (snapshot2.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (!snapshot2.hasData) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (snapshot2.data!.docs.isNotEmpty) {
                                final decument =
                                    snapshot2.data!.docs[widget.index];
                                final deta = decument.data();

                                final strtcheck = deta['strttime'];
                                final endcheck = deta['endtime'];

                                return Column(children: [
                                  Container(
                                    width: mediaquery.width,
                                    height: mediaquery.height * 0.4,
                                    decoration: const BoxDecoration(
                                        color: whiteback,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: ValueListenableBuilder(
                                      valueListenable: location,
                                      builder: (context, value, child) {
                                        return ValueListenableBuilder(
                                          valueListenable: turfname,
                                          builder: (context, value, child) {
                                            return Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: StreamBuilder(
                                                      stream: store
                                                          .collection(
                                                              'TurfDetails')
                                                          .doc(data['userid'])
                                                          .collection('images')
                                                          .snapshots(),
                                                      builder:
                                                          (context, snapshot1) {
                                                        if (snapshot1
                                                                .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return const Center(
                                                              child:
                                                                  CircularProgressIndicator());
                                                        }
                                                        if (!snapshot1
                                                            .hasData) {
                                                          return const Center(
                                                              child:
                                                                  CircularProgressIndicator());
                                                        }
                                                        final banimg = snapshot1
                                                                .data!.docs[0]
                                                            ['turfimage'];
                                                        return Column(
                                                          children: [
                                                            Container(
                                                              width: mediaquery
                                                                  .width,
                                                              height: mediaquery
                                                                      .height *
                                                                  0.2,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: NetworkImage(
                                                                          banimg),
                                                                      fit: BoxFit
                                                                          .cover),
                                                                  borderRadius: const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          7))),
                                                            ),
                                                            sheight,
                                                            sheight,
                                                            turfname.value =
                                                                data[
                                                                    'courtname'],
                                                            location.value =
                                                                data[
                                                                    'location'],
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  data[
                                                                      'courtname'],
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          30,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      letterSpacing:
                                                                          0),
                                                                ),
                                                                sheight,
                                                                Text(
                                                                  data[
                                                                      'location'],
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          83,
                                                                          83,
                                                                          83),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      letterSpacing:
                                                                          1),
                                                                ),
                                                                Text(
                                                                  '+91 ${data['contactinfo']}',
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          83,
                                                                          83,
                                                                          83),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      letterSpacing:
                                                                          1),
                                                                ),
                                                                Text(
                                                                  data[
                                                                      'discription'],
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          83,
                                                                          83,
                                                                          83),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      letterSpacing:
                                                                          1),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        );
                                                      }),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  sheight,
                                  fieldtext('Date'),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: mediaquery.height * 0.05,
                                    decoration: const BoxDecoration(
                                        color: whiteback,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: fieldtext(tdate),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  fieldtext('Start Time'),
                                  const SizedBox(height: 20),
                                  ValueListenableBuilder(
                                    valueListenable: strttime,
                                    builder: (context, value, child) {
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '6 AM') {
                                                  strttime.value = '6 AM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '6 AM'
                                                      ? Colors.grey
                                                      : strttime.value == '6 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '6 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '7 AM') {
                                                  strttime.value = '7 AM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '7 AM'
                                                      ? Colors.grey
                                                      : strttime.value == '7 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '7 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '8 AM') {
                                                  strttime.value = '8 AM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '8 AM'
                                                      ? Colors.grey
                                                      : strttime.value == '8 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '8 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '9 AM') {
                                                  strttime.value = '9 AM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '9 AM'
                                                      ? Colors.grey
                                                      : strttime.value == '9 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '9 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '10 AM') {
                                                  strttime.value = '10 AM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '10 AM'
                                                      ? Colors.grey
                                                      : strttime.value ==
                                                              '10 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '10 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '11 AM') {
                                                  strttime.value = '11 AM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '11 AM'
                                                      ? Colors.grey
                                                      : strttime.value ==
                                                              '11 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '11 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '12 PM') {
                                                  strttime.value = '12 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '12 PM'
                                                      ? Colors.grey
                                                      : strttime.value ==
                                                              '12 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '12 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '1 v') {
                                                  strttime.value = '1 v';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '1 PM'
                                                      ? Colors.grey
                                                      : strttime.value == '1 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '1 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '2 PM') {
                                                  strttime.value = '2 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '2 PM'
                                                      ? Colors.grey
                                                      : strttime.value == '2 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '2 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '3 PM') {
                                                  strttime.value = '3 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '3 PM'
                                                      ? Colors.grey
                                                      : strttime.value == '3 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '3 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '4 PM') {
                                                  strttime.value = '4 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '4 PM'
                                                      ? Colors.grey
                                                      : strttime.value == '4 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '4 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '5 PM') {
                                                  strttime.value = '5 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '5 PM'
                                                      ? Colors.grey
                                                      : strttime.value == '5 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '5 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '6 PM') {
                                                  strttime.value = '6 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '6 PM'
                                                      ? Colors.grey
                                                      : strttime.value == '6 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '6 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '7 PM') {
                                                  strttime.value = '7 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '7 PM'
                                                      ? Colors.grey
                                                      : strttime.value == '7 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '7 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '8 PM') {
                                                  strttime.value = '8 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '8 PM'
                                                      ? Colors.grey
                                                      : strttime.value == '8 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '8 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '9 PM') {
                                                  strttime.value = '9 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '9 PM'
                                                      ? Colors.grey
                                                      : strttime.value == '9 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '9 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '10 PM') {
                                                  strttime.value = '10 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '10 PM'
                                                      ? Colors.grey
                                                      : strttime.value ==
                                                              '10 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '10 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '11 PM') {
                                                  strttime.value = '11 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '11 PM'
                                                      ? Colors.grey
                                                      : strttime.value ==
                                                              '11 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '11 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (strtcheck != '12 PM') {
                                                  strttime.value = '12 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: strtcheck == '12 AM'
                                                      ? Colors.grey
                                                      : strttime.value ==
                                                              '12 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '12 AM'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  fieldtext('End Time'),
                                  const SizedBox(height: 20),
                                  ValueListenableBuilder(
                                    valueListenable: endtime,
                                    builder: (context, value, child) {
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '6 AM') {
                                                  endtime.value = '6 AM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '6 AM'
                                                      ? Colors.grey
                                                      : endtime.value == '6 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '6 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '7 AM') {
                                                  endtime.value = '7 AM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '7 AM'
                                                      ? Colors.grey
                                                      : endtime.value == '7 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '7 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '8 AM') {
                                                  endtime.value = '8 AM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '8 AM'
                                                      ? Colors.grey
                                                      : endtime.value == '8 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '8 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '9 AM') {
                                                  endtime.value = '9 AM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '9 AM'
                                                      ? Colors.grey
                                                      : endtime.value == '9 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '9 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '10 AM') {
                                                  endtime.value = '10 AM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '10 AM'
                                                      ? Colors.grey
                                                      : endtime.value == '10 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '10 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '11 AM') {
                                                  endtime.value = '11 AM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '11 AM'
                                                      ? Colors.grey
                                                      : endtime.value == '11 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '11 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '12 PM') {
                                                  endtime.value = '12 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '12 PM'
                                                      ? Colors.grey
                                                      : endtime.value == '12 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '12 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '1 PM') {
                                                  endtime.value = '1 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '1 PM'
                                                      ? Colors.grey
                                                      : endtime.value == '1 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '1 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '2 PM') {
                                                  endtime.value = '2 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '2 PM'
                                                      ? Colors.grey
                                                      : endtime.value == '2 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '2 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '3 PM') {
                                                  endtime.value = '3 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '3 PM'
                                                      ? Colors.grey
                                                      : endtime.value == '3 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '3 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '4 PM') {
                                                  endtime.value = '4 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '4 PM'
                                                      ? Colors.grey
                                                      : endtime.value == '4 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '4 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '5 PM') {
                                                  endtime.value = '5 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '5 PM'
                                                      ? Colors.grey
                                                      : endtime.value == '5 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '5 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '6 PM') {
                                                  endtime.value = '6 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '6 PM'
                                                      ? Colors.grey
                                                      : endtime.value == '6 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '6 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '7 PM') {
                                                  endtime.value = '7 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '7 PM'
                                                      ? Colors.grey
                                                      : endtime.value == '7 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '7 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '8 PM') {
                                                  endtime.value = '8 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '8 PM'
                                                      ? Colors.grey
                                                      : endtime.value == '8 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '8 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '9 PM') {
                                                  endtime.value = '9 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '9 PM'
                                                      ? Colors.grey
                                                      : endtime.value == '9 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '9 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '10 PM') {
                                                  endtime.value = '10 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '10 PM'
                                                      ? Colors.grey
                                                      : endtime.value == '10 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '10 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '11 PM') {
                                                  endtime.value = '11 PM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '11 PM'
                                                      ? Colors.grey
                                                      : endtime.value == '11 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '11 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                if (endcheck != '12 AM') {
                                                  endtime.value = '12 AM';
                                                }
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endcheck == '12 AM'
                                                      ? Colors.grey
                                                      : endtime.value == '12 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '12 AM'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ]);
                              } else {
                                return Column(children: [
                                  Container(
                                    width: mediaquery.width,
                                    height: mediaquery.height * 0.4,
                                    decoration: const BoxDecoration(
                                        color: whiteback,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
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
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                                if (!snapshot1.hasData) {
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                                final banimg = snapshot1
                                                    .data!.docs[0]['turfimage'];
                                                return Column(
                                                  children: [
                                                    Container(
                                                      width: mediaquery.width,
                                                      height:
                                                          mediaquery.height *
                                                              0.2,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image:
                                                                  NetworkImage(
                                                                      banimg),
                                                              fit:
                                                                  BoxFit.cover),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          7))),
                                                    ),
                                                    sheight,
                                                    sheight,
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          data['courtname'],
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 30,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      0),
                                                        ),
                                                        sheight,
                                                        Text(
                                                          data['location'],
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          83,
                                                                          83,
                                                                          83),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1),
                                                        ),
                                                        Text(
                                                          '+91 ${data['contactinfo']}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          83,
                                                                          83,
                                                                          83),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1),
                                                        ),
                                                        Text(
                                                          data['discription'],
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          83,
                                                                          83,
                                                                          83),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                  sheight,
                                  fieldtext('Date'),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: mediaquery.height * 0.05,
                                    decoration: const BoxDecoration(
                                        color: whiteback,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: fieldtext(tdate),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  fieldtext('Start Time'),
                                  const SizedBox(height: 20),
                                  ValueListenableBuilder(
                                    valueListenable: strttime,
                                    builder: (context, value, child) {
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '6 AM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '6 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '6 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '7 AM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '7 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '7 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '8 AM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '8 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '8 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '9 AM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '9 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '9 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '10 AM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '10 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '10 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '11 AM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '11 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '11 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '12 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '12 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '12 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '1 v';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '1 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '1 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '2 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '2 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '2 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '3 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '3 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '3 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '4 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '4 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '4 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '5 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '5 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '5 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '6 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '6 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '6 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '7 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '7 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '7 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '8 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '8 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '8 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '9 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '9 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '9 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '10 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '10 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '10 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '11 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '11 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '11 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                strttime.value = '12 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      strttime.value == '12 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '12 AM'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  fieldtext('End Time'),
                                  const SizedBox(height: 20),
                                  ValueListenableBuilder(
                                    valueListenable: endtime,
                                    builder: (context, value, child) {
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '6 AM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endtime.value == '6 AM'
                                                      ? homecolor
                                                      : whiteback,
                                                  time: '6 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '7 AM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endtime.value == '7 AM'
                                                      ? homecolor
                                                      : whiteback,
                                                  time: '7 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '8 AM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endtime.value == '8 AM'
                                                      ? homecolor
                                                      : whiteback,
                                                  time: '8 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '9 AM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endtime.value == '9 AM'
                                                      ? homecolor
                                                      : whiteback,
                                                  time: '9 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '10 AM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      endtime.value == '10 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '10 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '11 AM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      endtime.value == '11 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '11 AM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '12 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      endtime.value == '12 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '12 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '1 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endtime.value == '1 PM'
                                                      ? homecolor
                                                      : whiteback,
                                                  time: '1 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '2 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endtime.value == '2 PM'
                                                      ? homecolor
                                                      : whiteback,
                                                  time: '2 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '3 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endtime.value == '3 PM'
                                                      ? homecolor
                                                      : whiteback,
                                                  time: '3 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '4 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endtime.value == '4 PM'
                                                      ? homecolor
                                                      : whiteback,
                                                  time: '4 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '5 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endtime.value == '5 PM'
                                                      ? homecolor
                                                      : whiteback,
                                                  time: '5 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '6 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endtime.value == '6 PM'
                                                      ? homecolor
                                                      : whiteback,
                                                  time: '6 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '7 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endtime.value == '7 PM'
                                                      ? homecolor
                                                      : whiteback,
                                                  time: '7 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '8 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endtime.value == '8 PM'
                                                      ? homecolor
                                                      : whiteback,
                                                  time: '8 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '9 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color: endtime.value == '9 PM'
                                                      ? homecolor
                                                      : whiteback,
                                                  time: '9 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '10 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      endtime.value == '10 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '10 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '11 PM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      endtime.value == '11 PM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '11 PM'),
                                            ),
                                            swidth,
                                            InkWell(
                                              onTap: () {
                                                endtime.value = '12 AM';
                                              },
                                              child: slotcontainer(
                                                  context: context,
                                                  color:
                                                      endtime.value == '12 AM'
                                                          ? homecolor
                                                          : whiteback,
                                                  time: '12 AM'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ]);
                              }
                            }),
                      ))));
        });
  }

  datacheck({String? userid}) {
    if (strttime.value == '' || endtime.value == '') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Choose A Valid Slote', style: TextStyle(fontSize: 15)),
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: Duration(seconds: 2),
      ));
    } else {
      bookslotdetails(
          strttime: strttime.value,
          endtime: endtime.value,
          turfname: turfname.value,
          location: location.value,
          isbooked: true,
          userid: userid!);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => PaymentScreen(
                    index: widget.index,
                  )));
    }
  }
}
