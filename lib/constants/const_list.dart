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

List<Viewclass> viewclass = [
  // Viewclass(
  //     prefixicon: const Icon(Icons.bookmark_added), childtext: 'My Booking'),
  // Viewclass(prefixicon: const Icon(Icons.favorite), childtext: 'My Favorite'),
  Viewclass(
      prefixicon: const Icon(Icons.bookmark_outline_rounded),
      childtext: 'My Booking'),
  Viewclass(
      prefixicon: const Icon(Icons.support_agent), childtext: 'Help & Support'),
  Viewclass(prefixicon: const Icon(Icons.settings), childtext: 'Settings'),
  Viewclass(prefixicon: const Icon(Icons.info), childtext: 'Privacy Policy'),
  Viewclass(prefixicon: const Icon(Icons.share), childtext: 'Invite Friends')
];
