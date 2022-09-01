<<<<<<< Updated upstream
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
=======
// import 'package:firebase_core/firebase_core.dart';
>>>>>>> Stashed changes

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:vehicle_service_app/ui/dashboard.dart';
=======
import 'package:vehicle_service_app/ui/components/info_updatepopup.dart';
import 'package:vehicle_service_app/ui/dashboard.dart';
import 'package:vehicle_service_app/ui/screens/mycars.dart';
import 'package:vehicle_service_app/ui/screens/updateprofile.dart';
>>>>>>> Stashed changes
import 'package:vehicle_service_app/ui/welcome.dart';
//import 'package:vehicle_service_app/ui/dashboard.dart';

// Future
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool isLoggedin = FirebaseAuth.instance.currentUser!= null;
  runApp( MyApp(isLoggedin));
}

class MyApp extends StatelessWidget {
  const MyApp(this.isLoggedin, {Key? key }) : super(key: key);
  final bool isLoggedin;

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      title: 'Vehicle Service',
      home: isLoggedin?Homepage(): HomePage(),
    );
=======
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        title: 'Vehicle Service',
        home: HomePage());
>>>>>>> Stashed changes
  }
}
