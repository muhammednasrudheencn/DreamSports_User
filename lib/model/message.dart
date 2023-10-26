import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderid;
  final String senderNumber;
  final String reciverid;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderid,
    required this.senderNumber,
    required this.reciverid,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> tomap() {
    return {
      'senderid': senderid,
      'sendernumber': senderNumber,
      'riciverid': reciverid,
      'message': message,
      'time': timestamp,
    };
  }
}
