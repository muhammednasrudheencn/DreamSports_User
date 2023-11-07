// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks, must_be_immutable

import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/match/const.dart';
import 'package:dream_sports_user/screens/navigatedscreens/navigated_screen.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TournamentDetails extends StatelessWidget {
  final String game;
  final String gametype;
  final String teamname;
  dynamic teamnavatar;

  TournamentDetails({
    super.key,
    required this.game,
    required this.gametype,
    required this.teamname,
    required ValueNotifier teamnavatar,
  });

  ValueNotifier<TextEditingController> datecontroller =
      ValueNotifier(TextEditingController());
  ValueNotifier<TextEditingController> starttimecontroller =
      ValueNotifier(TextEditingController());

  ValueNotifier<TimeOfDay> pickedtime = ValueNotifier(TimeOfDay.now());

  final locationcontroller = TextEditingController();
  final pregroundcontroller = TextEditingController();
  final demandagecontroller = TextEditingController();
  final slotcountcontroller = TextEditingController();
  final rulescomtroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final customsize = MediaQuery.of(context).size;
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
        title: headingtext(heading: 'Host Tournament'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 30)),
                fieldtext('You Selected Sport'),
                sheight,
                SizedBox(
                  width: customsize.width,
                  height: customsize.height * 0.10,
                  child: Card(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            teamname,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0),
                          ),
                          Text(
                            game,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0),
                          ),
                          Text(
                            '($gametype)',
                            style:
                                const TextStyle(fontSize: 15, letterSpacing: 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                sheight,
                ValueListenableBuilder(
                  valueListenable: datecontroller,
                  builder: (context, value, child) {
                    datecontroller.value.text =
                        DateFormat("dd MMMM yyyy").format(DateTime.now());
                    return TextField(
                      controller: datecontroller.value,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                          hintText: 'DD MM YYYY',
                          prefixIcon: Icon(Icons.date_range_outlined),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)))),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2250));

                        if (pickeddate != null) {
                          datecontroller.value.text =
                              DateFormat("dd MMMM yyyy").format(pickeddate);
                        }
                      },
                    );
                  },
                ),
                sheight,
                ValueListenableBuilder(
                  valueListenable: starttimecontroller,
                  builder: (context, value, child) {
                    return TextField(
                      controller: starttimecontroller.value,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                          hintText: 'Start Time',
                          prefixIcon: Icon(Icons.timer_sharp),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)))),
                      onTap: () async {
                        pickedtime.value = (await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ))!;

                        starttimecontroller.value.text =
                            pickedtime.value.format(context).toString();
                      },
                    );
                  },
                ),
                sheight,
                ctextfild(
                    controller: locationcontroller,
                    hint: 'Location',
                    icons: const Icon(Icons.location_on_outlined)),
                sheight,
                ctextfild(
                    controller: pregroundcontroller,
                    hint: 'Preference Ground',
                    icons: const Icon(Icons.sports_soccer_sharp)),
                sheight,
                fieldtext('Rules'),
                sheight,
                ctextfild(
                    controller: demandagecontroller,
                    hint: 'Demand Age',
                    icons: const Icon(Icons.data_saver_off_sharp)),
                sheight,
                ctextfild(
                    controller: slotcountcontroller,
                    hint: 'Slot Count',
                    icons: const Icon(Icons.view_compact)),
                sheight,
                mtextfild(
                  controller: rulescomtroller,
                  hint: 'Additional rules',
                ),
                sheight,
                ElevatedButton(
                  onPressed: () {
                    hostbuttonsts(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: homecolor,
                      fixedSize:
                          Size(customsize.width, customsize.height * 0.07)),
                  child: const Text(
                    'Host Your Tournament',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  hostbuttonsts(BuildContext context) {
    if (datecontroller.value.text.trim().isNotEmpty &&
        locationcontroller.text.trim().isNotEmpty &&
        locationcontroller.text.trim().isNotEmpty &&
        demandagecontroller.text.trim().isNotEmpty &&
        slotcountcontroller.text.trim().isNotEmpty &&
        starttimecontroller.value.text.trim() != TimeOfDay.now() &&
        rulescomtroller.text.trim().isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Match Hosting Success...',
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: homecolor,
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: Duration(seconds: 2),
      ));
      tournamentdetailadd(
          game: game,
          teamname: teamname,
          gametype: gametype,
          starttime: pickedtime.value.format(context).toString(),
          date: datecontroller.value.text.trim(),
          location: locationcontroller.text.trim(),
          preground: pregroundcontroller.text.trim(),
          agedemand: demandagecontroller.text.trim(),
          slotcount: slotcountcontroller.text.trim(),
          rules: rulescomtroller.text.trim(),
          teamavatar: teamnavatar);
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const NavigatedScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Please Take Game Details',
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: Duration(seconds: 2),
      ));
    }
  }
}
