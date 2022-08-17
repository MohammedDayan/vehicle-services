import 'package:flutter/material.dart';
import 'package:vehicle_service_app/config/authentication.dart';
import 'package:vehicle_service_app/config/constants.dart';
import 'package:vehicle_service_app/ui/screens/screens.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.black12,
      body: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/suv1.jpg'),
            fit: BoxFit.cover,
          )),
          child: Column(children: [
            //Rent a perfect car for any occasion
            Center(
              child: Container(
                padding: const EdgeInsets.only(right: 60),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 110,
                    horizontal: 20,
                  ),
                  child: Text('Rent a perfect car for any occasion!',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
            //causing overflow of widgets in first page
             SizedBox(
                 height: size.height / 3,
                ),

            Column(verticalDirection: VerticalDirection.down, children: [
              Container(
                //Text
                child: const Text(
                  'Rent a great car at a cheap price',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                alignment: Alignment.bottomCenter,
              ),

              const SizedBox(
                height: 10,
              ),

              //Link button
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    child: const Text(
                      'Get Started ',
                      // style: TextStyle(fontSize: 10),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        primary:  kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 20)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                  ),
                ),
                alignment: Alignment.bottomRight,
              )
            ])
          ])),
    );
  }
}
