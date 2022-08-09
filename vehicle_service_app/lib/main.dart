import 'package:flutter/material.dart';
import 'package:vehicle_service_app/ui/home1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      title: 'Vehicle Service',
      home: HomePage(),
    );
  }
}
