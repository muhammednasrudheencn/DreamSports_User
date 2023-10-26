import 'dart:io';

import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/services/firestore.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CeateTeamScreen extends StatefulWidget {
  const CeateTeamScreen({super.key});

  @override
  State<CeateTeamScreen> createState() => _CeateTeamScreenState();
}

File? _image;
String? downimg;
final teamnamecontroller = TextEditingController();
String skill = '';

class _CeateTeamScreenState extends State<CeateTeamScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 246, 246),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: blackback,
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: headingtext(heading: 'CREATE YOUR TEAM'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
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
              const SizedBox(height: 20),
              textfield1(
                  hint: 'Team Name',
                  preicon: const Icon(Icons.groups),
                  controller: teamnamecontroller),
              sheight,
              sheight,
              sheight,
              fieldtext('Team Skill'),
              sheight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        skill = 'Beginner';
                      });
                    },
                    child: Container(
                      width: mediaquery.width * 0.3,
                      height: mediaquery.height * 0.06,
                      decoration: BoxDecoration(
                          color: whiteback,
                          border: Border.all(
                              color: const Color.fromARGB(255, 238, 237, 237)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                      child: Center(
                        child: Text(
                          'Beginner',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: skill == 'Beginner'
                                  ? blackback
                                  : Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        skill = 'Amature';
                      });
                    },
                    child: Container(
                      width: mediaquery.width * 0.3,
                      height: mediaquery.height * 0.06,
                      decoration: BoxDecoration(
                          color: whiteback,
                          border: Border.all(
                              color: const Color.fromARGB(255, 238, 237, 237)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                      child: Center(
                        child: Text(
                          'Amature',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color:
                                  skill == 'Amature' ? blackback : Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        skill = 'Advanced';
                      });
                    },
                    child: Container(
                      width: mediaquery.width * 0.3,
                      height: mediaquery.height * 0.06,
                      decoration: BoxDecoration(
                          color: whiteback,
                          border: Border.all(
                              color: const Color.fromARGB(255, 238, 237, 237)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                      child: Center(
                        child: Text(
                          'Advanced',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: skill == 'Advanced'
                                  ? blackback
                                  : Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  createstatus();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: homecolor,
                    fixedSize:
                        Size(mediaquery.width, mediaquery.height * 0.06)),
                child: const Text(
                  'Create',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  createstatus() {
    if (teamnamecontroller.text.trim().isEmpty || skill == '') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Team Creation Failed : Take A Team Name',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: Duration(seconds: 2),
      ));
    } else {
      addteamintofirestore(
          teamname: teamnamecontroller.text.trim(), skill: skill);
      uploadteamavatar(downimage: downimg, image: _image);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Your Team Created Successfuly',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        backgroundColor: homecolor,
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: Duration(seconds: 2),
      ));
      Navigator.pop(context);
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
