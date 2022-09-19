import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vehicle_service_app/ui/screens/preview_screen.dart';

import '../model/car.dart';

List<Car> leaseCars = [];
List<Car> recentimg = [
  Car(
      name: "Camry",
      brand: 'Toyota',
      vin: '',
      insurance: '',
      imgurl: "assets/2.png",
      descip: " 2020 red",
      city: "Kumasi",
      fuelLevel: '',
      tankCapacity: '',
      millage: '',
      speed: '',
      power: '',
      engineType: '',
      currency: 'Ghc',
      amount: '200',
      dur: '1'),
  Car(
      name: "Camry",
      brand: 'Toyota',
      vin: '',
      insurance: '',
      imgurl: "assets/1.png",
      descip: "Toyota 2022 blue",
      city: "Accra",
      fuelLevel: '',
      tankCapacity: '',
      millage: '',
      speed: '',
      power: '',
      engineType: '',
      currency: 'GHc',
      amount: '300',
      dur: '1'),
  Car(
    name: "Pickup",
    brand: 'Toyota',
    vin: '',
    insurance: '',
    imgurl: "assets/3.jpg",
    descip: " Toyota 2016 white",
    city: "Kumasi",
    fuelLevel: '',
    tankCapacity: '',
    millage: '',
    speed: '',
    power: '',
    engineType: '',
    currency: 'Ghc',
    amount: '300',
    dur: '1',
  ),
  Car(
    name: "Navara ",
    brand: 'Toyota',
    vin: '',
    insurance: '',
    imgurl: "assets/4.jpg",
    descip: " Nissan 2020 blue-black",
    city: "Kumasi",
    fuelLevel: '',
    tankCapacity: '',
    millage: '',
    speed: '',
    power: '',
    engineType: '',
    currency: 'Ghc',
    amount: '300',
    dur: '1',
  ),
];

List<Widget> recentSlider = recentimg
    .map((item) => InkWell(
      child: Container(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey.withOpacity(0.4),
                      border: Border.all(color: Colors.blueGrey.withOpacity(0.4))
                      ),
                  child: Stack(
                    children: [
                      Center(
                          child: Image.asset(
                        item.imgurl,
                        height: 200,
                        width: 210,
                      )),
                      Positioned(
                          left: 10,
                          top: 3,
                          child: Container(
                            child: Text(item.name),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
    ))
    .toList();
