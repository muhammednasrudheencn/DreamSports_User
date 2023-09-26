import 'dart:io';

import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dream_sports_user/registering/screen_date_genter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  final String phone;
  const RegisterScreen({super.key, required this.phone});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernamecontroller = TextEditingController();

  final aboutcontroller = TextEditingController();

  final phonecontroller = TextEditingController();

  final emailcontroller = TextEditingController();

  @override
  void initState() {
    phonecontroller.text = widget.phone;
    super.initState();
  }

  PickedFile? imagefile;
  // final ImagePicker _picker = ImagePicker();

  getImagegallery(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imagefile = File(picture!.path) as PickedFile?;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                radius: mediaquery.width * 0.14,
                backgroundColor: const Color.fromARGB(255, 199, 198, 198),
                child: CircleAvatar(
                  radius: mediaquery.width * 0.13,
                ),
              ),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => imgbottom(
                          width: mediaquery.width,
                          height: mediaquery.height * 0.1),
                    );
                  },
                  child: const Text(
                    'Choos Profile Pic',
                  )),
              sheight,
              sheight,
              sheight,
              TextFormField(
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: whiteback,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: whiteback),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: homecolor),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(Icons.person),
                    hintText: 'User Name'),
                controller: usernamecontroller,

                // inputFormatters: [
                //   LengthLimitingTextInputFormatter(length),
                // ],
              ),
              sheight,
              TextFormField(
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: whiteback,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: whiteback),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: homecolor),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(Icons.abc),
                    hintText: 'About'),
                controller: aboutcontroller,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
              ),
              sheight,
              TextFormField(
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: whiteback,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: whiteback),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: homecolor),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(Icons.phone_android_outlined),
                    hintText: 'Mobile'),
                controller: phonecontroller,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
              ),
              sheight,
              TextFormField(
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: whiteback,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: whiteback),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: homecolor),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: 'Email'),
                controller: emailcontroller,

                // inputFormatters: [
                //   LengthLimitingTextInputFormatter(length),
                // ],
              ),
              sheight,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: homecolor,
                    fixedSize:
                        Size(mediaquery.width, mediaquery.height * 0.06)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => DateNdGenderScreen(
                                username: usernamecontroller.text.trim(),
                                about: aboutcontroller.text.trim(),
                                phone: widget.phone,
                                email: emailcontroller.text.trim(),
                                imagepath: 'shfjdh',
                              )));
                },
                child: const Text(
                  'Continue',
                  style:
                      TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget imgbottom({
    var width,
    var height,
  }) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          fieldtext('Choose Profile Pic'),
          sheight,
          sheight,
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.camera),
              ),
              swidth,
              swidth,
              IconButton(
                onPressed: () {
                  getImagegallery(context);
                },
                icon: const Icon(Icons.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
