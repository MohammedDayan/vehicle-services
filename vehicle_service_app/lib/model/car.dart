import 'dart:core';

import 'package:flutter/material.dart';

class Car {
  String name;
  String imgurl;
  String descip;
  String city;
  List<Feature> features;
  final String currency;
  final String amount;
  final String dur;

  Car(
      {required this.name,
      required this.imgurl,
      required this.descip,
      required this.city,
      required this.features,
      required this.amount,
      required this.currency,
      required this.dur
      });

      
}

class Feature{
  final IconData icon;
  final String title;
  final String value;

  Feature({required this.icon, required this.title, required this.value});
}
