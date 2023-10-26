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
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color,
            borderRadius: senderid == auth.currentUser!.uid
                ? const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  )),
        child: Text(
          message,
          style: const TextStyle(fontSize: 20, color: whiteback),
        ),
      ),
    );
  }
}
