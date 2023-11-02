import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';

final _firestore = FirebaseFirestore.instance;

Future<void> addingdata() async {
  Map<String, dynamic> datas = {
    'sampleid': 12345678,
    'samplename': 'nasru',
  };
  await _firestore.collection('Sample').doc(auth.currentUser!.uid).set(datas);
}
