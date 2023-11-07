// ignore_for_file: camel_case_types

import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
import 'package:flutter/material.dart';

class chatbubble extends StatelessWidget {
  final String message;
  final String senderid;
  final Color color;
  const chatbubble({
    super.key,
    required this.message,
    required this.senderid,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        decoration: BoxDecoration(
            color: color,
            borderRadius: senderid == auth.currentUser!.uid
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(30),
                  )
                : const BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(15),
                  )),
        child: Text(
          message,
          style: const TextStyle(fontSize: 25, color: whiteback),
        ),
      ),
    );
  }
}
