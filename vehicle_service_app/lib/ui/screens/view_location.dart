import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:vehicle_service_app/config/constants.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  late LatLng sourceLocation = LatLng(currentLocation?.latitude?? 6.570071, currentLocation?.longitude?? -1.630783);
  static const LatLng destination = LatLng(6.700071, -1.630783);

  List<LatLng> polylineCoordinates= [];
  LocationData? currentLocation;

  void getCurrentLocation (){
    Location location = Location();

    location.getLocation().then(
      (location) {
      currentLocation = location;
      getPolyPoints();
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key, 
      // PointLatLng(currentLocation?.latitude?? 6.570071, currentLocation?.longitude?? -1.630783),
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude), 
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
          ),
         );
         setState(() {});
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    
    super.initState(); 
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: currentLocation == null 
        ? Center(child: Text('Loading...'))
        : FutureBuilder(
          builder: (context,snapshot) {
            return GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                      zoom: 14.5,
                    ),
                    polylines: {
                      Polyline(
                        polylineId: PolylineId('route'),
                        points: polylineCoordinates,
                        color: Color.fromARGB(255, 41, 87, 124),
                        width: 5,
                      )
                    },
                    markers: {
                      Marker(
                        markerId: MarkerId('currentLocation'),
                        position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                      ),
                      Marker(
                        markerId: MarkerId('source'),
                        position: sourceLocation,
                        infoWindow: InfoWindow(title: 'Me')
                      ),
                      Marker(
                        markerId: MarkerId('destination'),
                        position: destination,
                        infoWindow: InfoWindow(title: 'Branch location')
                      ),
                    },
                  );
          }
        ),
          
      ),
    );
  }
}