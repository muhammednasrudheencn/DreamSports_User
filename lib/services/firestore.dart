import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final auth = FirebaseAuth.instance;
final store = FirebaseFirestore.instance;
final storage = FirebaseStorage.instance;
addtofirestore({
  required String username,
  required String about,
  required String phone,
  required String email,
  required String age,
  required String gender,
}) async {
  final Map<String, dynamic> userData = {
    'name': username,
    'about': about,
    'phone': phone,
    'emailid': email,
    'age': age,
    'gender': gender,
    'userid': auth.currentUser!.uid,
  };

  await FirebaseFirestore.instance
      .collection('User')
      .doc(auth.currentUser!.uid)
      .set(userData);
}

Map<String, dynamic>? userData;
userSet() async {
  final snapshot = await FirebaseFirestore.instance
      .collection('User')
      .where("userid", isEqualTo: auth.currentUser!.uid)
      .get();

  final document = snapshot.docs[0];
  final data = document.data();
  userData = data;
}

deleteuser() async {
  await store.collection('User').doc(auth.currentUser!.uid).delete();
}

uploadimage({required String? downimage, required File? image}) async {
  final postId = DateTime.now().millisecondsSinceEpoch.toString();
  Reference ref = storage
      .ref()
      .child('${auth.currentUser!.uid}/Profileimg')
      .child('PostId$postId');
  await ref.putFile(image!);
  downimage = await ref.getDownloadURL();

  await store
      .collection('User')
      .doc(auth.currentUser!.uid)
      .collection('images')
      .add({'Profileimg': downimage}).whenComplete(
          () => showsnackbar(content: 'Image Uploaded'));
}

showsnackbar({BuildContext? context, required var content, Color? color}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
    content: Text(content),
    backgroundColor: color,
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100, right: 10, left: 10),
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    closeIconColor: Colors.white,
    duration: const Duration(seconds: 2),
  ));
}
