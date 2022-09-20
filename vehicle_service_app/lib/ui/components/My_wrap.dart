import 'package:flutter/material.dart';
import 'package:vehicle_service_app/config/constants.dart';

class WrapAround extends StatelessWidget {
  const WrapAround({ Key? key,
      required this.myicon,
      required this.info,
      required this.mynum
       }) 
      : super(key: key);
  final String info;
  final IconData myicon;
  final String mynum;
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,),
      child: Container(
         width: MediaQuery.of(context).size.width / 3.9,
         height: MediaQuery.of(context).size.height / 5.4,
         decoration: BoxDecoration(
          color: Color.fromARGB(255, 230, 213, 165).withOpacity(0.9),
          borderRadius: BorderRadius.circular(20)
         ),

         child: Padding(
          padding: const EdgeInsets.only(top: 10, left:15, right: 15, bottom: 10 
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                   child: Icon(
                    myicon
                   )),
                
                
              ),
               SizedBox(height: 5,),
              Text(
                info,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 12,
                  
                 // fontWeight: FontWeight.bold,
                  color: Colors.black,
                  
                ),
              ),

               SizedBox(height: 5,),
               Text(
                mynum,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 15,
                 
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              
            ],
          )
          
        ),
      ),
    );
  }
}