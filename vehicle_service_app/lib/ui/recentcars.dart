import 'package:flutter/material.dart';

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
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: [
                Image.asset(item.imgurl),
                Positioned(
                    child: Container(
                  child: Text(item.name),
                ))
              ],
            ),
          ),
        ))
    .toList();
