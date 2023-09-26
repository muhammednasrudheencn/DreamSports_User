import 'package:flutter/material.dart';

import '../screens/class/view_class.dart';

const List<String> catogoryitem = [
  'Football',
  'Cricket',
  'Volley',
  'Swimming',
  'Basketball',
];

const List offerbanner = [
  {
    'id': 1,
    'imagepath':
        'https://cdn.sporfy.com/coupon/COUP2023041181115pNZy/4uDVVbAQ-desktop_icon.webp'
  },
  {
    'id': 2,
    'imagepath':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzshA3wUv6MqMlmDfLABozWWHI7ivbK_qq9w&usqp=CAU'
  },
  {
    'id': 3,
    'imagepath':
        'https://img.freepik.com/free-vector/gradient-football-social-media-cover-template_23-2149889042.jpg'
  }
];

const List<String> imageurl = [
  'https://5.imimg.com/data5/SELLER/Default/2022/7/NO/TC/UJ/134008477/football-turf-4-500x500.jpeg',
  'https://content.jdmagicbox.com/comp/malappuram/q7/9999px483.x483.220319002209.w9q7/catalogue/squad-x-football-turf-malappuram-mini-football-fields-220u5c121h.jpg?clr=',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw3QjClWkBaB7iFpF6-zsVSsQ0LAK-pc2xzg&usqp=CAU',
  'https://5.imimg.com/data5/SELLER/Default/2023/7/324317415/HE/RS/OQ/56657667/7-a-side-football-turf-500x500.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCmepTC526owOKdqslvX-SYO6v7yrKV4azKQ&usqp=CAU',
];
const List<String> turfname = [
  'Soccer City',
  'Squad X',
  'Golden Boot',
  'Mini Camp',
  'Soccer Point',
];
const List<String> locations = [
  'Calicut',
  'Ramanattukara',
  'Faroke',
  'Ramanattukara',
  'Chelari',
];

List<Viewclass> viewclass = [
  Viewclass(
      prefixicon: const Icon(Icons.bookmark_added), childtext: 'My Booking'),
  Viewclass(prefixicon: const Icon(Icons.favorite), childtext: 'My Favorite'),
  Viewclass(
      prefixicon: const Icon(Icons.support_agent), childtext: 'Help & Support'),
  Viewclass(prefixicon: const Icon(Icons.settings), childtext: 'Settings'),
  Viewclass(prefixicon: const Icon(Icons.info), childtext: 'Privacy Policy'),
  Viewclass(prefixicon: const Icon(Icons.share), childtext: 'Invite Friends')
];
