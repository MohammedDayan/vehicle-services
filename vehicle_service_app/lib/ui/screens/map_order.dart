import 'dart:async';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_service_app/config/constants.dart';
import 'package:vehicle_service_app/ui/components/request_view.dart';
import 'package:vehicle_service_app/ui/screens/updateprofile.dart';
import '../widgets/rounded_input_field.dart';


class mapOrder extends StatefulWidget {
  const mapOrder({Key? key}) : super(key: key);

  @override
  State<mapOrder> createState() => _mapOrderState();
}
class _mapOrderState extends State<mapOrder> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(5.614818, -0.205874);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);
  TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
             body: SizedBox(
                width: size.width,
                height: size.height,
                child: Stack(
                  children: [
                    // Container(
                    //     height: size.height / 1.6,
                    //     width: size.width,
                    //     color: Colors.grey[300],
                    //     child: GoogleMap(
                    //       initialCameraPosition: CameraPosition(
                    //         target: sourceLocation,
                    //         zoom: 14.5,
                    //       ),
                          
                    //     ),
                    // ),

                    
                       Container(
                         child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                //height: size.height / 2.5,
                                width: size.width,
                                decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color:Colors.blueGrey.withOpacity(0.2)))),
                                      //color: Colors.blueGrey,
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

                                     Column(
                                       children: [
                                         Center(
                                            child: Container(
                                              child: RoundedInputField(
                                                controller: _date,
                                                
                                                icon: Icons.calendar_month,
                                                hintText: "Enter Start Date",
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              child: RoundedInputField(
                                                icon: Icons.calendar_month,
                                                hintText: "Enter Return Date",
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              child: RoundedInputField(
                                                icon: Icons.location_on,
                                                hintText: "Enter Pickup location",
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              child: RoundedInputField(
                                                icon: Icons.location_on,
                                                hintText: "Enter Return location",
                                              ),
                                            ),
                                          ),

                                     
                                         ElevatedButton(
                                              child: const Text(
                                                'Book car',
                                                // style: TextStyle(fontSize: 10),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(15.0),
                                                  ),
                                                  primary: kPrimaryColor,
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 40,
                                                          vertical: 20)),
                                              onPressed: () {
                                                 Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const manageRequest(),
                                                    ));
                                              },
                                            ),
                                      
                                       ],
                                     ),
                                     
                                     
                                    //  Center(
                                    //    child: Container(
                                    //      child: RoundedInputField(
                                    //       icon: Icons.location_on,
                                    //       hintText: "Enter your location",
                                    // ),
                                    //    ),
                                    //  ),

                                  ],
                                ),
                              ),
                              ),
                            ],
                          ),
                       ),
                      
                    
                  ],
                ),
             )
            )
            );
  }
}