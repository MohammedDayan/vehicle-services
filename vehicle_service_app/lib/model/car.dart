import 'dart:core';

import 'package:flutter/material.dart';

class Car {
  String imgurl;
  String descip;
  String city;
  // final features;
  final String currency;
  final String amount;
  final String dur;
  final String speed;
  final String tankCapacity;
  final String fuelLevel;
  final String engineType;
  final String millage;
  final String power;
  final String name;
  final String brand;
  final String vin;
  final String insurance;

  Car(
      {required this.speed,
      required this.tankCapacity,
      required this.fuelLevel,
      required this.engineType,
      required this.millage,
      required this.power,
      required this.brand,
      required this.vin,
      required this.insurance,
      required this.name,
      required this.imgurl,
      required this.descip,
      required this.city,
      // required this.features,
      required this.amount,
      required this.currency,
      required this.dur});
}

// class Feature {
//   final IconData icon;
//   final String title;
//   final String value;

//   Feature({required this.icon, required this.title, required this.value});
// }
