import 'package:flutter/material.dart';
import 'package:vehicle_service_app/app_ui/recentcars.dart';
import 'package:vehicle_service_app/model/car.dart';

class rentCar extends StatefulWidget {
  @override
  State<rentCar> createState() => _rentCarState();
}

Widget _buildCarList(BuildContext context, Car recentimg) {
  return ListTile(
    title: Text(recentimg.name),
    leading: Image.asset(recentimg.imgurl),
    subtitle: Text(recentimg.descip),
    onTap: () {
      print("whatsa app");
    },
  );
}

class _rentCarState extends State<rentCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: const Color.fromARGB(255, 2, 32, 56),
          title: const Text(
            "Find a car to Rent",
            style: TextStyle(
              color: Color.fromRGBO(1, 48, 87, 1),
            ),
            textAlign: TextAlign.right,
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: recentimg.length,
            itemBuilder: (context, index) =>
                _buildCarList(context, recentimg[index])));
  }
}
