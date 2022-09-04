import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_service_app/ui/dashboard.dart';
import 'package:vehicle_service_app/ui/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool isLoggedin = FirebaseAuth.instance.currentUser != null;
  runApp(MyApp(isLoggedin));
}

class MyApp extends StatelessWidget {
  const MyApp(this.isLoggedin, {Key? key}) : super(key: key);
  final bool isLoggedin;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      title: 'Vehicle Service',
      home: isLoggedin ? Homepage() : HomePage(),
    );
  }
}
