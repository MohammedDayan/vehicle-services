import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vehicle_service_app/firebase_options.dart';
import 'package:vehicle_service_app/ui/dashboard.dart';
import 'package:vehicle_service_app/ui/screens/carOwnerView.dart';
import 'package:vehicle_service_app/ui/screens/login_screen.dart';
import 'package:vehicle_service_app/ui/screens/mycars.dart';
import 'package:vehicle_service_app/ui/screens/new_dash.dart';
import 'package:vehicle_service_app/ui/screens/usertype.dart';
import 'package:vehicle_service_app/ui/welcome.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // bool isLoggedin = FirebaseAuth.instance.currentUser != null;

  runApp(MyApp());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Container(child: Lottie.asset('assets/car-safety.json')),
      ),
      backgroundColor: Colors.blueGrey.withOpacity(0.5),
      nextScreen: HomeDash(),
    );
  }
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      title: 'Vehicle Service',
      // home: isLoggedin ? Homepage() : HomePage(),

      // home: carOwnersView(),
       home: LoginScreen(),
    );
  }
}
