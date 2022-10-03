import 'dart:core';

import 'package:flutter/material.dart';

class Branch {
  final String name;
  final String phone;
  final String gps;
  final String city;

  Branch(
      {required this.phone,
      required this.name,
      required this.gps,
      required this.city});
}
