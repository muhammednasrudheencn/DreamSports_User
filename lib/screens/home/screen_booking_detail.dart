import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:flutter/material.dart';

class BookingDetail extends StatelessWidget {
  const BookingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainhome,
      floatingActionButton: FloatingActionButton.extended(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7))),
        backgroundColor: homecolor,
        onPressed: () {},
        label: Row(
          children: [
            const Text(
              'BOOK TURF',
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
        title: fieldtext('BOOKING TURF'),
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
              ),
              sheight,
              fieldtext('Date'),
              const SizedBox(height: 20),
              SizedBox(
                height: mediaquery.height * 0.08,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 5),
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    child: Container(
                      width: mediaquery.width * 0.20,
                      height: mediaquery.height * 0.08,
                      color: whiteback,
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Oct',
                              style: TextStyle(fontSize: 15),
                            ),
                            Text('6',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text('Fri', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              fieldtext('Time'),
              const SizedBox(height: 20),
              const Center(
                child: Column(
                  children: [Text('SELECT YOUR SLOT')],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
