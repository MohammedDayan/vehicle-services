import 'package:firebase_auth/firebase_auth.dart';
import 'package:vehicle_service_app/ui/screens/login_screen.dart';

Future<bool> signIn(email, password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> register(email, password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'week-password') {
      print('the password provided is too weak');
    } else if (e.code == 'email-already-in-use') {
      print('An account exists for this email , try using a different email.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}















// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:vehicle_service_app/ui/dashboard.dart';
// import 'package:vehicle_service_app/ui/screens/login_screen.dart';

// class authPage extends StatelessWidget {
//   const authPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Homepage();
//         } else {
//           return LoginScreen();
//         }
//       },
//     ));
//   }
// }
