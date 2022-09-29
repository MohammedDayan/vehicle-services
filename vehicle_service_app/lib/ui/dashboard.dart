import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vehicle_service_app/ui/recentcars.dart';
import 'package:vehicle_service_app/ui/rentacar.dart';
import 'package:vehicle_service_app/ui/screens/available_cars.dart';
import 'package:vehicle_service_app/ui/screens/mycars.dart';
import 'package:vehicle_service_app/ui/widgets/brands.dart';
import 'package:vehicle_service_app/ui/widgets/drawer.dart';
import 'package:vehicle_service_app/ui/widgets/search_cars.dart';
import 'package:vehicle_service_app/ui/screens/updateprofile.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  final user = FirebaseAuth.instance.currentUser!;

  void initState() {
    // TODO: implement initState

    super.initState();

    {
      WidgetsBinding.instance?.addPostFrameCallback((_) => {
            if (user.photoURL == null && user.displayName == null)
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => updateProfile()))
              }
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // status bar color
        statusBarIconBrightness: Brightness.dark));

    return Container(
      color: Colors.white,
      child: Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                              icon: const Icon(Icons.menu),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              }),
                        ),
                        // CircleAvatar(
                        //   backgroundImage: user.photoURL != null
                        //       ? NetworkImage(user.photoURL!)
                        //       : const NetworkImage(
                        //           'https://cdn2.iconfinder.com/data/icons/action-states-vol-4-flat/48/Action___States_-_Vol._4-10-512.png'),
                        //   radius: 20,
                        // )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          user.displayName != null
                              ? 'Hello ' + user.displayName!
                              : "hello User",
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: const EdgeInsets.fromLTRB(
                        20.0,
                        0.0,
                        0.0,
                        0.0,
                      ),
                      child: const Text('Welcome to rent any car of your choice')),
                  const SizedBox(
                    height: 15.0,
                  ),

                  GestureDetector(
                    onTap: () =>
                        showSearch(context: context, delegate: SearchCars()),
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.search),
                            Text('Search car to rent'),
                            Icon(Icons.settings),
                          ],
                        ) //search
                        ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 200, bottom: 3),
                    child: Text(
                      'Top Brands',
                      style: TextStyle(
                        fontSize: 25,  
                      ),
                  ),
                  ),
                  
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            brand(myimage: "assets/Lexus.jpg", name: 'Jaguar'),
                            brand(myimage: "assets/Lexus.jpg", name: 'Toyota'),
                            brand(myimage: "assets/bmw.jpg", name: 'BMW'),
                            brand(myimage: "assets/Lexus.jpg", name: 'Honda'),
                            brand(myimage: "assets/Lexus.jpg", name: 'Audi'),
                            brand(myimage: "assets/Lexus.jpg", name: 'Benz'),
                           // brand(myimage: "assets/images/lexus-logo.jpg", name: 'Lexus'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  Container(
                    padding: const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
                    alignment: AlignmentDirectional.topStart,
                    child: const Text(
                      'Recent Cars',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    height: size.height/3.2,
                    width: size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                     // border: Border(
                        //left: BorderSide(width: 1, color: Colors.red),
                        //right: BorderSide(width: 1, color: Colors.red)
                      //),
                      borderRadius: BorderRadius.circular(20),
                     // color: Colors.blueGrey.withOpacity(0.2),
                      //shape: BoxShape.rectangle
                    ),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                      ),
                      items: recentSlider,
                    ),
                  )
                ],
              ),
              // const SizedBox(
              //   height: 20.0,
              // ),
              
              

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  Container(
                   // padding: EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20.0),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => availCar())),
                      child: Ink(
                        width: MediaQuery.of(context).size.width/1.1,
                        height: MediaQuery.of(context).size.height / 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color.fromARGB(255, 2, 32, 56),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            child: Center(
                              child: Stack(
                                children: [
                                  
                                     Center(
                                       child: Container(
                                        alignment:
                                            AlignmentDirectional.center,
                                        margin: EdgeInsets.all(5.0),
                                        child: const Text(
                                          'See all available cars',
                                          style: TextStyle(
                                              fontSize: 20.0, color: Colors.white),
                                        ),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
