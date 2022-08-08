import 'package:flutter/material.dart';
import 'package:vehicle_service_app/ui/home1.dart';
import 'package:vehicle_service_app/ui/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Vehicle Service',
      home:  HomePage(),
    );
  }
}
