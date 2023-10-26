import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_sports_user/model/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  Future<void> sendmessage(
      {required String reciverid, required String message}) async {
    final String currentuserid = auth.currentUser!.uid;
    final String? curretusernumber = auth.currentUser!.phoneNumber;
    final Timestamp timestamp = Timestamp.now();

    Message newmessage = Message(
        senderid: currentuserid,
        senderNumber: curretusernumber!,
        reciverid: reciverid,
        message: message,
        timestamp: timestamp);

    List<String> ids = [currentuserid, reciverid];
    ids.sort();
    String chatroomid = ids.join("_");

    await store
        .collection('chat_rooms')
        .doc(chatroomid)
        .collection('messages')
        .add(newmessage.tomap());
  }

  Stream<QuerySnapshot> getmessages(
      {required String userid, required String otheruserid}) {
    List<String> ids = [userid, otheruserid];
    ids.sort();
    String chatroomid = ids.join('_');

    return store
        .collection('chat_rooms')
        .doc(chatroomid)
        .collection('messages')
        .orderBy('time', descending: false)
        .snapshots();
  }
}
