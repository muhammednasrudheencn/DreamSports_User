import 'dart:io';

import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dream_sports_user/screens/registering/screen_date_genter.dart';
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

  File? _image;
  String? downimag;

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
                  child: _image != null
                      ? CircleAvatar(
                          radius: mediaquery.width * 0.13,
                          backgroundImage: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ).image,
                        )
                      : CircleAvatar(
                          radius: mediaquery.width * 0.13,
                          backgroundImage: Image.asset(
                            user,
                            fit: BoxFit.cover,
                          ).image,
                        )),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      showDragHandle: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) => imgbottom(
                          height: mediaquery.height * 0.22,
                          toheight: mediaquery.height * 0.06,
                          towidth: mediaquery.width),
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
                  registerstatus();
                  uploadprofile(downimage: downimag, image: _image);
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

  registerstatus() {
    if (usernamecontroller.text.trim().isEmpty ||
        aboutcontroller.text.trim().isEmpty ||
        phonecontroller.text.trim().isEmpty ||
        emailcontroller.text.trim().isEmpty) {
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
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => DateNdGenderScreen(
                    username: usernamecontroller.text.trim(),
                    about: aboutcontroller.text.trim(),
                    phone: widget.phone,
                    email: emailcontroller.text.trim(),
                  )));
    }
  }

  getimage({required ImageSource sorce}) async {
    try {
      final imagePicker = ImagePicker();
      final pickedImage = await imagePicker.pickImage(source: sorce);
      if (pickedImage == null) return null;
      File? image = File(pickedImage.path);
      // image = await imgcrop(imagefile: image);
      setState(() {
        _image = image;
        Navigator.pop(context);
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  // Future<File?> imgcrop({required File imagefile}) async {
  //   CroppedFile? cropedimage =
  //       await ImageCropper().cropImage(sourcePath: imagefile.path);
  //   if (cropedimage == null) return null;
  //   return File(cropedimage.path);
  // }

  imgbottom({var width, var height, var toheight, var towidth}) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose Photo',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(towidth, toheight),
                    backgroundColor: whiteback,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
                onPressed: () {
                  getimage(sorce: ImageSource.camera);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera,
                      color: blackback,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Use Camera',
                      style: TextStyle(
                          color: blackback, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Text('OR', style: TextStyle(fontSize: 15)),
              const SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(towidth, toheight),
                    backgroundColor: whiteback,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
                onPressed: () {
                  getimage(sorce: ImageSource.gallery);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.photo,
                      color: blackback,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Brouser Gallery',
                      style: TextStyle(
                          color: blackback, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ],
      ),
    );
  }
}
