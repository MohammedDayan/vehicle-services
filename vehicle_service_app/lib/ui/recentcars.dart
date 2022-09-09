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
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blueGrey
          ),
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  item.imgurl,
                  height: 200,
                  width: 210,
                )
              ),
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
    ))
.toList();
