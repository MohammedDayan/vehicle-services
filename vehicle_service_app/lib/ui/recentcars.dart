import 'package:flutter/material.dart';

import '../model/car.dart';

List<Car> recentimg = [
  Car(
      name: "Camry",
      imgurl: "assets/2.png",
      descip: " 2020 red",
      city: "Kumasi",
      features: [],
      currency: '',
      amount: '',
      dur: ''
      ),
  Car(
      name: "Camry",
      imgurl: "assets/1.png",
      descip: "Toyota 2022 blue",
      city: "Accra",
      features: [],
      currency: '',
      amount: '',
      dur: ''
      ),
      
  Car(
      name: "Pickup",
      imgurl: "assets/3.jpg",
      descip: " Toyota 2016 white",
      city: "Kumasi",
      features: [],
      currency: '',
      amount: '',
      dur: '',
      ),
  Car(
      name: "Navara ",
      imgurl: "assets/4.jpg",
      descip: " Nissan 2020 blue-black",
      city: "Kumasi",
      features: [],
      currency: '',
      amount: '',
      dur: '',
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
