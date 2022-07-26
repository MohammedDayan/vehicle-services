import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:vehicle_service_app/config/constants.dart';

class brand extends StatelessWidget {
  const brand({ Key? key,
      required this.myimage,
      required this.name
       }) 
      : super(key: key);
  final String myimage;
  final String name;
  @override
  Widget build(BuildContext context) {
    
    return Padding(
     padding: const EdgeInsets.only(left: 7.0,),
     child: FocusedMenuHolder(
        onPressed: () {},
          blurBackgroundColor: Colors.blueGrey[900],
          // menuOffset: 10,
          openWithTap: true,
         // duration: Duration(seconds: 1),
          menuItems: [
            FocusedMenuItem(
            title: Text('There is no $name car yet'),
            onPressed: () {}),
          ],
       child: Container(
           width: 70,
           height: 75,
           decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(20)
           ),
          
             child: Padding(
              padding: const EdgeInsets.only(top: 15, left:5, right: 5, bottom: 5,),
              child: Column(
                children: [
                    Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    child: Align(
                       alignment: Alignment.center,
                       child: Image.asset(
                        myimage
                       )),   
                  ),

                   SizedBox(height: 5,),
                  Text(
                    name,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 12,
                     // fontWeight: FontWeight.bold,
                      color: Colors.black,
                      
                    ),
                  ),
                ],
              ),
        ),
            
       ),
     ),
    );
      
    
  }
}