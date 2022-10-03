import 'package:d_chart/d_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vehicle_service_app/ui/recentcars.dart';
import 'package:vehicle_service_app/ui/rentacar.dart';
import 'package:vehicle_service_app/ui/screens/lessor_info_screen.dart';
import 'package:vehicle_service_app/ui/screens/mycars.dart';
import 'package:vehicle_service_app/ui/widgets/drawer.dart';
import 'package:vehicle_service_app/ui/widgets/search_cars.dart';

import 'available_cars.dart';
import 'companyInfo.dart';
import 'companyprofile.dart';
import 'manage_car_screen.dart';

class carOwnersView extends StatefulWidget {
  const carOwnersView({Key? key}) : super(key: key);

  @override
  State<carOwnersView> createState() => _HomepageState();
}

class _HomepageState extends State<carOwnersView> {
  final user = FirebaseAuth.instance.currentUser!;
  int _selectIndex = 0;
  PageController pageController = PageController();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    {
      WidgetsBinding.instance.addPostFrameCallback((_) => {
            if (user.photoURL == null && user.displayName == null)
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => companyProfile()))
              }
          });
    }
  }

  void onTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // status bar color
        statusBarIconBrightness: Brightness.dark));

    return Container(
      color: Colors.white,
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(user.displayName != null
                    ? " Rentals" + user.displayName!
                    : 'Rentals'),
                // Text(
                //   DateTime.now().toString(),
                //   style: TextStyle(color: Colors.white),
                // ),
              ],
            ),
          ),
          backgroundColor: Colors.grey[200],
          body: SafeArea(
            child: PageView(
              controller: pageController,
              children: [
                home(),
                requests(),
                manageCar(),
                companyInfo(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.request_page), label: 'Requests'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.car_rental), label: 'Manage Cars'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Update info'),
            ],
            currentIndex: _selectIndex,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            onTap: onTapped,
          )),
    );
  }

  Widget home() {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            height: 200.0,
            width: 400.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color.fromARGB(255, 2, 12, 20)),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Total Number of Cars",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        '20',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      )
                    ]),
                SizedBox(height: 20.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Cars Curently on Rent",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      )
                    ]),
              ],
            ),
          ),
          Row(
            children: [
              const RotatedBox(
                quarterTurns: 3,
                child: Text("Earnings \$"),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: DChartLine(
                        data: const [
                          {
                            'id': 'Line',
                            'data': [
                              {'domain': 0, 'measure': 4.1},
                              {'domain': 2, 'measure': 4},
                              {'domain': 3, 'measure': 6},
                              {'domain': 4, 'measure': 1},
                            ],
                          },
                        ],
                        includePoints: true,
                        lineColor: (lineData, index, id) => Colors.amber,
                      ),
                    ),
                  ),
                  Text("Months"),
                ]),
              ),
            ],
          ),
          Container()
        ],
      ),
    );
  }

  requests() {
    return Container();
  }

  manageCars() {
    return manageCar();
    // return Column(children: [
    //   // const Center(
    //   //     child: Text("Manage car",
    //   //         style: TextStyle(color: Color.fromRGBO(1, 48, 87, 1)))),
    //   // Row(
    //   //   mainAxisAlignment: MainAxisAlignment.end,
    //   //   children: [
    //   //     ElevatedButton(onPressed: () {}, child: Text('Add Car')),
    //   //   ],
    //   // ),
    //   manageCar(),
    // ]);
  }
}
