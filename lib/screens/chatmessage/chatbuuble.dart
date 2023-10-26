import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:flutter/material.dart';

class chatbubble extends StatelessWidget {
  final String message;
  final Color color;
  const chatbubble({super.key, required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Text(
          message,
          style: const TextStyle(fontSize: 20, color: whiteback),
        ),
      ),
    );
  }
}
