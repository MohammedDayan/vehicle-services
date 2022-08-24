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




class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         
                        IconButton(
                          icon: const Icon(CupertinoIcons.arrow_left),
                          onPressed: (){
                            Navigator.pop(context);
                          }
                        ),
                    
                         
                      ]
                    ),
                  ),

                  Stack(
                    children: [
                      Container(
                        height: size.height/1.85,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          
                          
                          
                        ),
                      ),
                        Padding(
                           padding: const EdgeInsets.only(top: 370.0),
                            child: Container(    
                              //height: size.height/3,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 30, top: 10),
                                  child:  Text(
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
 
                                Row(
                                children: [                      
                                  WrapAround(
                                    myicon: IconButton(
                                      onPressed: (){}, 
                                      icon: Icon(Icons.garage)
                                      ),
                                    info: 'Car speed',
                                    mynum: '300mph',
                                    ),

                                     WrapAround(
                                    myicon: IconButton(
                                      onPressed: (){}, 
                                      icon: Icon(Icons.garage)
                                      ),
                                    info: 'Car speed',
                                    mynum: '300mph',
                                    ),

                                     WrapAround(
                                    myicon: IconButton(
                                      onPressed: (){}, 
                                      icon: Icon(Icons.garage)
                                      ),
                                    info: 'Car speed',
                                    mynum: '300mph',
                                    ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 Myprice(currency: '\$', amount: '2500', dur: '/day'),

                                 ElevatedButton(
                                    child: const Text(
                                      'Book this car',
                                      // style: TextStyle(fontSize: 10),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        primary:  kPrimaryColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 20)),
                                    onPressed: () {
                                       Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const OrderCarScreen(),
                                            )
                                            );
                                    },
                  ),
                                  
                                ],
                              )
                              )
                              


                                ],
                              ),
                              
                             
                            ),

                            
                        )
                    ],
                  )
                ]
      )
          ]
    )
        )
      )
    );
  }
}

