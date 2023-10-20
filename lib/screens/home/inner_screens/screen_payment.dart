import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7))),
        backgroundColor: homecolor,
        onPressed: () {},
        label: Row(
          children: [
            const Text(
              'PAY AMOUNT',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(width: mediaquery.width * 0.5),
            const Icon(Icons.arrow_forward)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: whiteback,
        automaticallyImplyLeading: false,
        title: fieldtext('PAYMENT'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: mediaquery.width,
                height: mediaquery.height * 0.4,
                decoration: const BoxDecoration(
                    color: homecolor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
