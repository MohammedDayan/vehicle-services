import 'package:flutter/material.dart';
class Myprice extends StatelessWidget {
  const Myprice({ Key? key,
      required this.currency,
      required this.amount,
      required this.dur
       }) 
      : super(key: key);
  final String currency;
  final String amount;
  final String dur;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
               Text(
                 currency,
                style: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 10,
                  letterSpacing: 1,
                 // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

               Text(
                amount,
                style: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  letterSpacing: 1,
                 // fontWeight: FontWeight.bold,
                  color: Colors.black,
                  
                ),
              ),

               Text(
                dur,
                style: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 10,
                  letterSpacing: 1,
                 // fontWeight: FontWeight.bold,
                  color: Colors.black,
                  
                ),
              ),
      ],
    );
  }
} 