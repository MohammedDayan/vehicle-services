import 'package:flutter/material.dart';
import 'package:vehicle_service_app/ui/components/request_view.dart';
import 'package:vehicle_service_app/ui/dashboard.dart';

class HomeDash extends StatefulWidget {
  HomeDash({Key? key}) : super(key: key);

  @override
  State<HomeDash> createState() => _HomeDashState();
}

class _HomeDashState extends State<HomeDash> {
  int _selectIndex = 0;
  PageController pageController = PageController();

   void onTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
    pageController.jumpToPage(index);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.white,
      child: Scaffold(
          // appBar: AppBar(
          //   title: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text("Med rentals"),
          //       Text(
          //         DateTime.now().toString(),
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ],
          //   ),
          // ),
          backgroundColor: Colors.grey[200],
          body: SafeArea(
            child: PageView(
              controller: pageController,
              children: [
                Homepage(),
                requests(),
                
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.request_page), label: 'Requests'),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.car_rental), label: 'Manage Cars'),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.settings), label: 'Update info'),
            ],
            currentIndex: _selectIndex,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            onTap: onTapped,
          )),
    );
  }
  
  requests() {
    return Container();
  }
}