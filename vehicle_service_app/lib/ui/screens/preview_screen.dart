import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vehicle_service_app/config/constants.dart';
import 'package:vehicle_service_app/ui/components/My_wrap.dart';
import 'package:vehicle_service_app/ui/components/orderPrice.dart';
import 'package:vehicle_service_app/ui/recentcars.dart';
import 'package:vehicle_service_app/model/car.dart';
import 'package:vehicle_service_app/ui/screens/My_form.dart';
import 'package:vehicle_service_app/ui/screens/OrderCar_screen.dart';
import 'package:vehicle_service_app/ui/screens/login_screen.dart';
import 'package:vehicle_service_app/ui/screens/map_order.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key, required this.car}) : super(key: key);
  final car;

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      print(orientation);
    }
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: SizedBox(
                width: size.width,
                height: size.height,
                child: Stack(
                  children: [
                    Container(
                        height: size.height / 1.7,
                        width: size.width,
                        decoration: BoxDecoration(
                            //  color: Colors.black,
                            /* image: DecorationImage(
                      image: AssetImage('assets/images/login.jpg'),
                     // colorFilter: ColorFilter.mode(Colors.green, BlendMode.modulate,),
                      fit: BoxFit.cover,
                    ),*/
                            ),
                        child: Hero(
                            tag: widget.car['imgurl'],
                            child: Image.network(widget.car['imgurl']))),
                    Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: orientation == Orientation.landscape
                            ? const EdgeInsets.all(8.0)
                            : const EdgeInsets.all(0),
                        child: Container(
                          height:
                              orientation == Orientation.landscape ? 120 : null,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 30, top: 10),
                                  child: Text(
                                    'Features',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: orientation == Orientation.portrait
                                      ? Row(
                                          mainAxisAlignment: orientation ==
                                                  Orientation.landscape
                                              ? MainAxisAlignment.spaceAround
                                              : MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            WrapAround(
                                              myicon: Icons.speed,
                                              info: 'Car speed',
                                              mynum: widget.car['speed'],
                                            ),
                                            WrapAround(
                                              myicon: Icons.escalator,
                                              info: 'Engine type',
                                              mynum: widget.car['engineType'],
                                            ),
                                            WrapAround(
                                              myicon: Icons.garage,
                                              info: 'Mileage',
                                              mynum: widget.car['millage'],
                                            ),
                                            WrapAround(
                                              myicon: Icons.location_city,
                                              info: 'Power',
                                              mynum: widget.car['power'],
                                            ),
                                            WrapAround(
                                              myicon: Icons.local_gas_station,
                                              info: 'Tank Capacity',
                                              mynum: widget.car['tankCapacity'],
                                            ),
                                            WrapAround(
                                              myicon: Icons.local_gas_station,
                                              info: 'Fuel Level',
                                              mynum: widget.car['fuelLevel'],
                                            ),
                                          ],
                                        )
                                      : SizedBox(
                                          width: size.width,
                                          child: Padding(
                                            padding: orientation ==
                                                    Orientation.landscape
                                                ? const EdgeInsets.symmetric(
                                                    horizontal: 60)
                                                : const EdgeInsets.symmetric(
                                                    horizontal: 0),
                                            child: Row(
                                              mainAxisAlignment: orientation ==
                                                      Orientation.landscape
                                                  ? MainAxisAlignment
                                                      .spaceAround
                                                  : MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                WrapAround(
                                                  myicon: Icons.speed,
                                                  info: 'Car speed',
                                                  mynum: widget.car['speed'],
                                                ),
                                                WrapAround(
                                                  myicon: Icons.escalator,
                                                  info: 'Engine type',
                                                  mynum:
                                                      widget.car['engineType'],
                                                ),
                                                WrapAround(
                                                  myicon: Icons.garage,
                                                  info: 'Mileage',
                                                  mynum: widget.car['millage'],
                                                ),
                                                WrapAround(
                                                  myicon: Icons.location_city,
                                                  info: 'Power',
                                                  mynum: widget.car['power'],
                                                ),
                                                WrapAround(
                                                  myicon:
                                                      Icons.local_gas_station,
                                                  info: 'Tank Capacity',
                                                  mynum: widget
                                                      .car['tankCapacity'],
                                                ),
                                                WrapAround(
                                                  myicon:
                                                      Icons.local_gas_station,
                                                  info: 'Fuel Level',
                                                  mynum:
                                                      widget.car['fuelLevel'],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Myprice(
                                            currency: widget.car['currency'],
                                            amount: widget.car['amount'],
                                            dur: '/day'),
                                        ElevatedButton(
                                          child: const Text(
                                            'Book this car',
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
                                            //tying required user details to process order

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      OrderCarScreen(
                                                    car: widget.car,
                                                  ),
                                                ));
                                          },
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 10,
                        left: 3,
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ))),
                    Positioned(
                        top: 370,
                        left: 10,
                        child: Column(
                          children: [
                            Text(
                              widget.car['name'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              widget.car['descip'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ))
                  ],
                ))));
  }
}
