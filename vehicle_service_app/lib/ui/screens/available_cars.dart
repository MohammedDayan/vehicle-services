import 'package:flutter/material.dart';
import 'package:vehicle_service_app/ui/components/My_wrap.dart';
import 'package:vehicle_service_app/ui/components/orderPrice.dart';
import 'package:vehicle_service_app/ui/recentcars.dart';
import 'package:vehicle_service_app/model/car.dart';
import 'package:vehicle_service_app/ui/screens/preview_screen.dart';

class availCar extends StatefulWidget {
  @override
  State<availCar> createState() => _availCarState();
}

Widget _buildCarList(BuildContext context, Car recentimg) {
  Size size = MediaQuery.of(context).size;
  return Hero(
    tag: recentimg.imgurl,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7),
      child: Container(
        child: Material(
          child: InkWell(
            borderRadius: BorderRadius.circular(20.0),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyOrder(
                            car: recentimg,
                          )));
            },
            child: Ink(
              height: size.height / 3.5,
              //width: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromARGB(255, 226, 214, 182).withOpacity(0.5),
              ),
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  alignment: AlignmentDirectional.center,
                  child: Center(
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          top: -45,
                          left: 10,
                          child: Center(
                              child: Container(
                            //color: Colors.red,
                            height: size.height / 6,
                            child: Image.asset(
                              recentimg.imgurl,
                              width: size.width / 1.2,
                              height: size.height / 1.9,
                            ),
                          )),
                        ),
                        Positioned(
                          bottom: 32.0,
                          left: 5.0,
                          right: 0.0,
                          child: Container(
                            alignment: AlignmentDirectional.bottomStart,
                            margin: EdgeInsets.all(5.0),
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Colors.blueGrey.withOpacity(0.2))),
                              ),
                              child: Text(
                                recentimg.name,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 80.0, left: 10, bottom: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.garage),
                                        Text("500hq"),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.garage,
                                          //color: Colors.white,
                                        ),
                                        Text("500hq"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Myprice(
                                    currency: '\$',
                                    amount: '2500',
                                    dur: '/day'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class _availCarState extends State<availCar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          foregroundColor: const Color.fromARGB(255, 2, 32, 56),
          title: const Text(
            "Find a car to Rent",
            style: TextStyle(
              color: Color.fromRGBO(1, 48, 87, 1),
            ),
            textAlign: TextAlign.right,
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: recentimg.length,
            itemBuilder: (context, index) =>
                _buildCarList(context, recentimg[index])));
  }
}
