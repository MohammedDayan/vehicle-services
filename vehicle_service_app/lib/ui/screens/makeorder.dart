import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vehicle_service_app/config/constants.dart';
import 'package:vehicle_service_app/ui/components/My_wrap.dart';
import 'package:vehicle_service_app/ui/recentcars.dart';
import 'package:vehicle_service_app/model/car.dart';




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
                        height: size.height/2,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          
                          
                          
                        ),
                      ),
                        Padding(
                           padding: const EdgeInsets.only(top: 320.0),
                            child: Container(    
                              height: size.height/2,
                              width: double.infinity,
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
                                  Text(
                                    'Features',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'OpenSans',
                                    ),
                                    ),

                                    SizedBox(
                                      height: 20,
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
                                ],
                              ),
                              
                             /*  */
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

