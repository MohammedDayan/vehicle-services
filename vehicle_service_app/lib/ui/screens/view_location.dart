import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  static const LatLng sourceLocation = LatLng(5.614818, -0.205874);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
                        height: size.height,
                        width: size.width,
                        color: Colors.grey[300],
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: sourceLocation,
                            zoom: 14.5,
                          ),
                          
                        ),
                    ),
      ),
    );
  }
}