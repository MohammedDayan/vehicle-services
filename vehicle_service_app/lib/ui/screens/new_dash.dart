import 'package:flutter/material.dart';
import 'package:vehicle_service_app/ui/components/request_view.dart';
import 'package:vehicle_service_app/ui/dashboard.dart';
import 'package:vehicle_service_app/ui/screens/manage_car_screen.dart';
import 'package:vehicle_service_app/ui/screens/my_requests.dart';
import 'package:vehicle_service_app/ui/screens/view_location.dart';

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
                myRequests(),
                requests(),
                
                
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.manage_accounts), label: 'My Requests'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.verified_user_outlined), label: 'Approved'),
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
    return Scaffold(
      appBar: AppBar(
          foregroundColor: const Color.fromARGB(255, 2, 32, 56),
          title: const Text(
            "Approved Requests",
            style: TextStyle(
              color: Color.fromRGBO(1, 48, 87, 1),
            ),   
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
      //padding: EdgeInsets.only(top: 50),
      child: Material(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 2),
              // height: size.height / 3.5,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[300],
                ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color:
                                Colors.blueGrey.withOpacity(0.2))),
                    ),
                    child: ListTile(
                      //textColor: Colors.red,
                      //shape: Border.all(width: 1, color: Colors.grey),
                      title: Text('Jaguar'),
                      leading: Image.asset('assets/jaguar.jpg'),
                      subtitle: Text('Pirana 2000'),
                      trailing: Icon(Icons.verified),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color:
                                  Colors.blueGrey.withOpacity(0.2))),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Center(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 17,
                                        backgroundImage: AssetImage('assets/IMG_0934.jpg'),
                                      ),
                                       SizedBox(
                                        width: 20,
                                      ),

                                      Text('Pop Rentals',
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),


                             
                            ],
                          ),
                         
                        ]
                      ),
                    ),
                  ),
                   Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          padding: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color:
                                      Colors.blueGrey.withOpacity(0.2))),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  "Find location and pick up car",
                                  style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'OpenSans',
                                      ),
                                ),
                              ),
                              InkWell(
                                onTap: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => location())),
                                child: Container(
                                  child: Text(
                                    'View Location',
                                    style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            child: Text('OR'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              child: const Text(
                                'Cancel Order',
                                // style: TextStyle(fontSize: 10),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0),
                                  ),
                                  primary: Colors.red.withOpacity(0.5),
                                  padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 30,
                                          vertical: 12)),
                              onPressed: () {
                              },
                            ),
                           
                          ],
                        ),
                      ],
                    ),
            )
                ],
              ),
            ),
           
          ],
        ),
      ),
        
    )
    );
  }
  
  
}