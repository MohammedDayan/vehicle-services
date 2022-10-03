import 'package:flutter/material.dart';
import 'package:vehicle_service_app/config/constants.dart';
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text('Make an Order'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            color: Colors.grey[100],
            // decoration:  BoxDecoration(
            //  // color: Colors.green.withOpacity(0.5),
            //     image: DecorationImage(
            //   image: AssetImage('assets/jaguar.jpg'),
            //   colorFilter: ColorFilter.mode(Colors.blueGrey, BlendMode.modulate,),
            //   fit: BoxFit.cover,
            // ),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [   
                    OrderForm(),
                    
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                      child: ElevatedButton(
                        child: const Text(
                          'Book car',
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
                            // Navigator.push(
                            // context,
                            // MaterialPageRoute(
                            //     builder: (context) => const OrderCarScreen(),
                            //     )
                            //     );
                        },
                        ),
                    )
                    
                  /* Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child:  RoundedButton(
                      text: 'Book now',
                      )
                    )*/
                    
                  
                  
                  ],
                      )
            ),
        ),
          //foregroundDecoration: ,
          
        
            
      ),
      );
    //);
    
   }
}


