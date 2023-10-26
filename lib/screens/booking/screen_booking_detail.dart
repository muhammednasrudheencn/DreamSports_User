import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/booking/const.dart';
import 'package:dream_sports_user/screens/payment/screen_payment.dart';
import 'package:dream_sports_user/services/firestore.dart';
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

String strttime = '';
String endtime = '';
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
                  if (strttime == '' || endtime == '') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please Select Start & End Time',
                          style: TextStyle(fontSize: 15)),
                      backgroundColor: Colors.red,
                      margin: EdgeInsets.all(10),
                      behavior: SnackBarBehavior.floating,
                      showCloseIcon: true,
                      closeIconColor: Colors.white,
                      duration: Duration(seconds: 2),
                    ));
                  } else {
                    bookslotdetails(
                        strttime: strttime,
                        endtime: endtime,
                        isbooked: true,
                        userid: data['userid']);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => PaymentScreen(
                                  index: widget.index,
                                )));
                  }
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
                                                        mediaquery.height * 0.2,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                banimg),
                                                            fit: BoxFit.cover),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
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
                                                        style: const TextStyle(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: 0),
                                                      ),
                                                      sheight,
                                                      Text(
                                                        data['location'],
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    83,
                                                                    83,
                                                                    83),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: 1),
                                                      ),
                                                      Text(
                                                        '+91 ${data['contactinfo']}',
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    83,
                                                                    83,
                                                                    83),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: 1),
                                                      ),
                                                      Text(
                                                        data['discription'],
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    83,
                                                                    83,
                                                                    83),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: 1),
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
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
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '6 AM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '6 AM'
                                                ? homecolor
                                                : whiteback,
                                            time: '6 AM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '7 AM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '7 AM'
                                                ? homecolor
                                                : whiteback,
                                            time: '7 AM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '8 AM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '8 AM'
                                                ? homecolor
                                                : whiteback,
                                            time: '8 AM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '9 AM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '9 AM'
                                                ? homecolor
                                                : whiteback,
                                            time: '9 AM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '10 AM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '10 AM'
                                                ? homecolor
                                                : whiteback,
                                            time: '10 AM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '11 AM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '11 AM'
                                                ? homecolor
                                                : whiteback,
                                            time: '11 AM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '12 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '12 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '12 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '1 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '1 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '1 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '2 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '2 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '2 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '3 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '3 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '3 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '4 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '4 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '4 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '5 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '5 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '5 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '6 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '6 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '6 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '7 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '7 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '7 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '8 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '8 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '8 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '9 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '9 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '9 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '10 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '10 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '10 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '11 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '11 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '11 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            strttime = '12 AM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: strttime == '12 AM'
                                                ? homecolor
                                                : whiteback,
                                            time: '12 AM'),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                fieldtext('End Time'),
                                const SizedBox(height: 20),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '6 AM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '6 AM'
                                                ? homecolor
                                                : whiteback,
                                            time: '6 AM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '7 AM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '7 AM'
                                                ? homecolor
                                                : whiteback,
                                            time: '7 AM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '8 AM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '8 AM'
                                                ? homecolor
                                                : whiteback,
                                            time: '8 AM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '9 AM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '9 AM'
                                                ? homecolor
                                                : whiteback,
                                            time: '9 AM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '10 AM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '10 AM'
                                                ? homecolor
                                                : whiteback,
                                            time: '10 AM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '11 AM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '11 AM'
                                                ? homecolor
                                                : whiteback,
                                            time: '11 AM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '12 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '12 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '12 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '1 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '1 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '1 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '2 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '2 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '2 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '3 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '3 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '3 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '4 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '4 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '4 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '5 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '5 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '5 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '6 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '6 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '6 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '7 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '7 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '7 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '8 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '8 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '8 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '9 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '9 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '9 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '10 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '10 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '10 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '11 PM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '11 PM'
                                                ? homecolor
                                                : whiteback,
                                            time: '11 PM'),
                                      ),
                                      swidth,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            endtime = '12 AM';
                                          });
                                        },
                                        child: slotcontainer(
                                            context: context,
                                            color: endtime == '12 AM'
                                                ? homecolor
                                                : whiteback,
                                            time: '12 AM'),
                                      ),
                                    ],
                                  ),
                                ),
                              ]);
                            }),
                      ))));
        });
  }
}
