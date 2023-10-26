import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/navigatedscreens/navigated_screen.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
import 'package:dream_sports_user/services/login_logout.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateNdGenderScreen extends StatefulWidget {
  final String username;
  final String about;
  final String phone;
  final String email;

  const DateNdGenderScreen({
    super.key,
    required this.username,
    required this.about,
    required this.phone,
    required this.email,
  });

  @override
  State<DateNdGenderScreen> createState() => _DateNdGenderScreenState();
}

final datecontrller = TextEditingController();

String gender = '';

class _DateNdGenderScreenState extends State<DateNdGenderScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: mediaquery.height * 0.1,
            ),
            fieldtext('Date Of Birth'),
            sheight,
            SizedBox(
              child: TextField(
                controller: datecontrller,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                    hintText: 'DD/MM/YYYY',
                    prefixIcon: Icon(Icons.date_range_outlined),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(Radius.circular(7)))),
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());

                  if (pickeddate != null) {
                    setState(() {
                      datecontrller.text =
                          DateFormat("dd MMMM yyyy").format(pickeddate);
                    });
                  }
                },
              ),
            ),
            sheight,
            sheight,
            sheight,
            fieldtext('Select Your Gender'),
            sheight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      gender = 'Male';
                    });
                  },
                  child: gendercontainer(
                      childtext: 'Male',
                      color: gender == 'Male' ? homecolor : whiteback,
                      height: mediaquery.height * 0.05,
                      width: mediaquery.width * 0.26),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      gender = 'Female';
                    });
                  },
                  child: gendercontainer(
                      childtext: 'Female',
                      color: gender == 'Female' ? homecolor : whiteback,
                      height: mediaquery.height * 0.05,
                      width: mediaquery.width * 0.26),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      gender = 'Other';
                    });
                  },
                  child: gendercontainer(
                      childtext: 'Other',
                      color: gender == 'Other' ? homecolor : whiteback,
                      height: mediaquery.height * 0.05,
                      width: mediaquery.width * 0.26),
                )
              ],
            ),
            sheight,
            sheight,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: homecolor,
                  fixedSize: Size(mediaquery.width, mediaquery.height * 0.06)),
              onPressed: () {
                addtofirestore(
                  username: widget.username,
                  about: widget.about,
                  phone: widget.phone,
                  email: widget.email,
                  age: datecontrller.text,
                  gender: gender,
                );
                userlogin(context);

                registerstatus();
              },
              child: const Text(
                'Continue',
                style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )),
    );
  }

  registerstatus() {
    if (datecontrller.text.trim().isEmpty || gender == '') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Registeration Failed Please Check Your Field',
            style: TextStyle(fontSize: 15)),
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: Duration(seconds: 2),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Registeration Success',
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: homecolor,
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: Duration(seconds: 2),
      ));
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const NavigatedScreen()));
    }
  }
}
