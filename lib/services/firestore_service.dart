import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

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

signout() async {
  await auth.signOut();
}

uploadprofile({required String? downimage, required File? image}) async {
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
      .collection('profile')
      .doc(auth.currentUser!.uid)
      .set({'Profileimg': downimage});
}

uploadteamavatar({required String? downimage, required File? image}) async {
  final postId = DateTime.now().millisecondsSinceEpoch.toString();
  Reference ref = storage
      .ref()
      .child('${auth.currentUser!.uid}/TeamAvatar')
      .child('PostId$postId');
  await ref.putFile(image!);
  downimage = await ref.getDownloadURL();

  await store
      .collection('User')
      .doc(auth.currentUser!.uid)
      .collection('Team')
      .doc(auth.currentUser!.uid)
      .collection('teamavatar')
      .doc(auth.currentUser!.uid)
      .set({'avatar': downimage});
}

addteamintofirestore({
  required String teamname,
  required String skill,
}) async {
  final Map<String, dynamic> userteam = {
    'teamname': teamname,
    'skill': skill,
    'userid': auth.currentUser!.uid,
  };

  await store
      .collection('User')
      .doc(auth.currentUser!.uid)
      .collection('Team')
      .doc(auth.currentUser!.uid)
      .set(userteam);
}

bookslotdetails(
    {required String strttime,
    required String endtime,
    required String turfname,
    required String location,
    required bool isbooked,
    required String userid}) async {
  final Map<String, dynamic> slotbooking = {
    'strttime': strttime,
    'endtime': endtime,
    'isBooked': isbooked,
    'slotid': auth.currentUser!.uid,
    'turfname': turfname,
    'location': location
  };

  await store
      .collection('TurfDetails')
      .doc(userid)
      .collection('BookedSlots')
      .doc(userid)
      .set(slotbooking);
}

matchaddtofirestore({
  required String game,
  required String teamname,
  required String gametype,
  required String date,
  required String location,
  required String preground,
  required teamavatar,
}) async {
  final uuid = const Uuid().v4();
  final Map<String, dynamic> matches = {
    'game': game,
    'gametype': gametype,
    'teamname': teamname,
    'date': date,
    'location': location,
    'ground': preground,
    'documentid': uuid,
    'userid': auth.currentUser!.uid,
  };

  store.collection('Matches').doc(uuid).set(matches);
}

tournamentdetailadd({
  required String game,
  required String teamname,
  required String gametype,
  required String date,
  required String location,
  required String preground,
  required String agedemand,
  required String slotcount,
  required String starttime,
  required String rules,
  required teamavatar,
}) async {
  final uuid = const Uuid().v4();
  final Map<String, dynamic> matches = {
    'game': game,
    'gametype': gametype,
    'teamname': teamname,
    'agedemand': agedemand,
    'slotcount': slotcount,
    'rules': rules,
    'starttime': starttime,
    'date': date,
    'location': location,
    'ground': preground,
    'documentid': uuid,
    'userid': auth.currentUser!.uid,
  };

  store.collection('Tournaments').doc(uuid).set(matches);
}
