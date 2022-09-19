import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vehicle_service_app/config/constants.dart';
import 'package:vehicle_service_app/ui/screens/updateprofile.dart';

import '../widgets/rounded_input_field.dart';


class mapOrder extends StatefulWidget {
  const mapOrder({Key? key}) : super(key: key);

  @override
  State<mapOrder> createState() => _mapOrderState();
}

class _mapOrderState extends State<mapOrder> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[300],
             body: SizedBox(
                width: size.width,
                height: size.height,
                child: Stack(
                  children: [
                    Container(
                        height: size.height / 1.7,
                        width: size.width,
                    ),

                    Positioned(
                      bottom: 0,
                      child: Column(
                        children: [
                          Container(
                            height: size.height / 3,
                            width: size.width,
                            decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage('assets/IMG_0934.jpg'),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),

                                        Text('Mohammed'),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    child: Icon(Icons.chat)
                                  ),

                                 ],
                                ),
                              ),

                               Center(
                                 child: Container(
                                   child: RoundedInputField(
                                    icon: Icons.location_on,
                                    hintText: "Enter your location",
                              ),
                                 ),
                               ),
                            ],
                          ),
                          ),
                        ],
                      )
                    )
                  ],
                ),
             )
            )
            );
  }
}