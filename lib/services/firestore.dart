import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;
final storeauth = FirebaseFirestore.instance;
addtofirestore({
  required String username,
  required String about,
  required String phone,
  required String email,
  required String age,
  required String gender,
  required String imagepath,
}) async {
  final Map<String, dynamic> userData = {
    'name': username,
    'about': about,
    'phone': phone,
    'emailid': email,
    'age': age,
    'gender': gender,
    'userid': auth.currentUser!.uid,
    'imagepath': imagepath,
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
  await storeauth.collection('User').doc(auth.currentUser!.uid).delete();
}
