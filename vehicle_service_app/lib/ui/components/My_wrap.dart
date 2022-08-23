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
  final Widget myicon;
  final String mynum;
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,),
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
         height: MediaQuery.of(context).size.height / 5,
         decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(20)
         ),

         child: Padding(
          padding: const EdgeInsets.all(5),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: myicon,
                
                
              ),
              
              Text(
                info,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 15,
                  letterSpacing: 1,
                 // fontWeight: FontWeight.bold,
                  color: Colors.black,
                  overflow: TextOverflow.clip
                ),
              ),

               Text(
                mynum,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  letterSpacing: 1,
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