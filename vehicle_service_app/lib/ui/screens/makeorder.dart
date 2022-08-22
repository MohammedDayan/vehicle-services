import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vehicle_service_app/config/constants.dart';




class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: kPrimaryColor,
          centerTitle: true,
          title: const Text(
            'Place an order',
          ),
          ) 
      )
    );
  }
}

