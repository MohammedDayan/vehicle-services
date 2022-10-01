import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_service_app/firebase_options.dart';
import 'package:vehicle_service_app/ui/dashboard.dart';
import 'package:vehicle_service_app/ui/screens/carOwnerView.dart';
import 'package:vehicle_service_app/ui/screens/login_screen.dart';
import 'package:vehicle_service_app/ui/screens/mycars.dart';
import 'package:vehicle_service_app/ui/screens/usertype.dart';
import 'package:vehicle_service_app/ui/welcome.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // bool isLoggedin = FirebaseAuth.instance.currentUser != null;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp(
      // this.isLoggedin,
      {
    Key? key,
  }) : super(key: key);

  // final bool isLoggedin;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      title: 'Vehicle Service',
      // home: isLoggedin ? Homepage() : HomePage(),

      // home: carOwnersView(),
      home: LoginScreen(),
    );
  }
}
