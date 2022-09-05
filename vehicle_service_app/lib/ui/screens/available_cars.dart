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
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyOrder(
                                car: recentimg,
                              )));
                        },
                        child: Ink(
                          height: size.height/3.5,
                          //width: 150.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color:  Color.fromARGB(255, 226, 214, 182).withOpacity(0.5),
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
                                      top: -35,
                                      left: 10,
                                      child: Center(
                                        child: Image.asset(
                                          recentimg.imgurl,
                                          width: size.width/1.3,
                                          height: size.height/1.9,

                                        )
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 30.0,
                                      left: 5.0,
                                      right: 0.0,
                                      child: Container(
                                        alignment:
                                            AlignmentDirectional.bottomStart,
                                        margin: EdgeInsets.all(5.0),
                                        child: Container(
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 170.0, left: 15),
                                            child: Text("500hq"),
                                          ),

                                          Myprice(
                                            currency: '\$', 
                                            amount: '2500', 
                                            dur: '/day')
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