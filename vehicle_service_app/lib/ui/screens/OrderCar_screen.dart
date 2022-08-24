import 'package:flutter/material.dart';
import 'package:vehicle_service_app/ui/screens/My_form.dart';
import 'package:vehicle_service_app/ui/widgets/widgets.dart';


class OrderCarScreen extends StatefulWidget {
  const OrderCarScreen({ Key? key,}) : super(key: key);

   @override
  State<OrderCarScreen> createState() => _OrderCarScreenState();
  
 
}

class _OrderCarScreenState extends State<OrderCarScreen> {
   @override
   Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(           
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          decoration:  BoxDecoration(
            color: Colors.green.withOpacity(0.5),
              image: DecorationImage(
            image: AssetImage('assets/MOB.jpg'),
            fit: BoxFit.cover,
          )),
          //foregroundDecoration: ,
          child: ListView(
            children: [
              Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Builder(
                          builder: (context) =>
                        IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.arrow_back),
                          onPressed: (){
                            Navigator.pop(context);
                          }
                        ),
                         
                         ),
                         
                         Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                          'Make an Order',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                         )
                       
                      ],
                    ),

              OrderForm(),


            ],
          )
        
            
      ),
      ),
    );
    
   }
}