import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:flutter/material.dart';

import '../constants/const_list.dart';

Widget logocontainer({
  var width,
  var height,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: const Row(
      children: [
        Image(
          image: AssetImage(logo),
        ),
      ],
    ),
  );
}

Widget catogarycontainer(var width, var height, String text) {
  return Card(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            text,
            style: const TextStyle(
                letterSpacing: 1,
                color: blackback,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}

Widget groundcontainer(
    {String? url, String? turfname, String? location, var width, var height}) {
  return SizedBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              child: Image(
                image: NetworkImage(url!),
                fit: BoxFit.cover,
              )),
        ),
        Text(
          turfname!,
          style: const TextStyle(
              color: blackback,
              fontSize: 15,
              fontWeight: FontWeight.w900,
              letterSpacing: 1),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          location!,
          style:
              const TextStyle(color: blackback, fontSize: 12, letterSpacing: 1),
        ),
        const SizedBox(
          height: 4,
        ),
        const SizedBox(
          width: 12,
          child: Image(
              image: NetworkImage(
                  'https://www.pngkit.com/png/detail/69-698330_football-clipart-black-and-white-football-black-white.png')),
        )
      ],
    ),
  );
}

Widget headingtext({String? heading}) {
  return Text(
    heading!,
    style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: blackback),
  );
}

Widget countingrow() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Card(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Matches',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                sheight,
                Text(
                  '0',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      Card(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Completed',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                sheight,
                Text(
                  '0',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}

Widget button2(
    {BuildContext? context,
    childtext,
    Icon? iconof,
    var width,
    var height,
    Widget? screen}) {
  return ElevatedButton.icon(
    onPressed: () {
      Navigator.push(context!, MaterialPageRoute(builder: (ctx) => screen!));
    },
    label: Text(
      childtext!,
      style: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 1),
    ),
    icon: iconof!,
    style: ElevatedButton.styleFrom(backgroundColor: homecolor),
  );
}

Widget infoitems() {
  return Card(
    child: ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(viewclass[index].childtext),
      ),
    ),
  );
}

Widget matches({var height, var width, String? text}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(7))),
    child: const Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('by User'),
                sheight,
                sheight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                    ),
                    swidth,
                    Column(
                      children: [
                        Text(
                          'V/S',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                          child: Image(
                            image: NetworkImage(football),
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                    swidth,
                    CircleAvatar(
                      radius: 35,
                    )
                  ],
                )
              ],
            )),
      ),
    ),
  );
}

Widget tournement({var height, var width, String? text}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(7))),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                    ),
                    swidth,
                    Text('Team Name'),
                  ],
                ),
                sheight,
                fieldtext('Details'),
                sheight,
                const Text('Match Level  :  7s'),
                const Text('   Location  :  Ramanattukara'),
                const Text('Under 18 /n 16 Slots /n '),
                const Text('Must Have Original Proof '),
              ],
            )),
      ),
    ),
  );
}

Widget searchfield() {
  return const TextField(
    decoration: InputDecoration(
        hintText: 'Search Spot',
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.all(Radius.circular(7)))),
  );
}

Widget spotlist({
  int? index,
  BuildContext? context,
  var width,
  var height,
  var imwidth,
  String? childtext,
  String? location,
  String? url,
}) {
  // // return InkWell(
  // //   onTap: () {
  // //     Navigator.push(context,
  // //         MaterialPageRoute(builder: (ctx) => TurfStatusScreen(index: index!)));
  // //   },
  //   child:
  return Card(
    child: SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                width: imwidth,
                height: height,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    image: DecorationImage(
                        image: NetworkImage(url!), fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(Radius.circular(7))),
              ),
              const SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    childtext!,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  Text(location!,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 83, 82, 82))),
                  const SizedBox(
                    height: 10,
                    child: Image(
                      image: NetworkImage(football),
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
  // );
}
