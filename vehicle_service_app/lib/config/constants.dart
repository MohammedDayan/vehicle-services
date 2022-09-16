import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xfff1bb274);
const kPrimaryLightColor = Color(0xfffeeeee4);
const wrapcolor = Color(0xfff575861);


class Defaults {
  static final Color drawerItemColor = Colors.blueGrey;
  static final Color drawerItemSelectedColor = Colors.blue;
  static final Color drawerSelectedTileColor = Color.fromARGB(255, 25, 93, 148);

  static final drawerItemText = [
    'Inbox',
    'Starred',
    'Sent',
    'Drafts',
    'Trash',
    'Spam',
  ];

  static final drawerItemIcon = [
    Icons.inbox,
    Icons.star,
    Icons.send,
    Icons.mail,
    Icons.delete,
    Icons.warning_rounded,
  ];

}
enum UserType { individual, company, renter }