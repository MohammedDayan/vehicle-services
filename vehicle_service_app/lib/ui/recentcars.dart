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
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/vehicle-services-3c12b.appspot.com/o/CarsImg%2F2.png?alt=media&token=18244e49-f32f-4486-9a15-29254eda69de",
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
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/vehicle-services-3c12b.appspot.com/o/CarsImg%2F1.png?alt=media&token=e6bb99dc-751d-4d32-944a-5be2864be928",
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
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/vehicle-services-3c12b.appspot.com/o/CarsImg%2F3.jpg?alt=media&token=8ce58a1c-034b-49fc-a5ac-fcdb832479d4",
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
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/vehicle-services-3c12b.appspot.com/o/CarsImg%2F4.jpg?alt=media&token=81729a9b-8b76-4e67-93e6-49e542c989c5",
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
                    color: Colors.grey[300],
                    //border: Border.all(color: Colors.blueGrey.withOpacity(0.4))
                  ),
                  child: Stack(
                    children: [
                      Center(
                          child: Image.network(
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
