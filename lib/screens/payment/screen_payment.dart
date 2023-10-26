import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/payment/payment.dart';
import 'package:dream_sports_user/services/firestore.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final int index;
  const PaymentScreen({super.key, required this.index});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    Razorpayresponse razor = Razorpayresponse();
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7))),
        backgroundColor: homecolor,
        onPressed: () {
          razor.makePayment();
        },
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
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: blackback,
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: headingtext(heading: 'PAYMENT '),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              StreamBuilder(
                  stream: store.collection('TurfDetails').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final document = snapshot.data!.docs[widget.index];
                    final data = document.data();
                    return Container(
                      width: mediaquery.width,
                      height: mediaquery.height * 0.4,
                      decoration: const BoxDecoration(
                          color: whiteback,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StreamBuilder(
                                stream: store
                                    .collection('TurfDetails')
                                    .doc(data['userid'])
                                    .collection('images')
                                    .snapshots(),
                                builder: (context, snapshot1) {
                                  if (snapshot1.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  if (!snapshot1.hasData) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  final banimg =
                                      snapshot1.data!.docs[0]['turfimage'];
                                  return Column(
                                    children: [
                                      Container(
                                        width: mediaquery.width,
                                        height: mediaquery.height * 0.2,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(banimg),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(7))),
                                      ),
                                      sheight,
                                      sheight,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            data['courtname'],
                                            style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0),
                                          ),
                                          sheight,
                                          Text(
                                            data['location'],
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 83, 83, 83),
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1),
                                          ),
                                          Text(
                                            '+91 ${data['contactinfo']}',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 83, 83, 83),
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1),
                                          ),
                                          Text(
                                            data['discription'],
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 83, 83, 83),
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1),
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
