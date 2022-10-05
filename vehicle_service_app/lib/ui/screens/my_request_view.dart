import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class manageRequest extends StatelessWidget {
  const manageRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Material(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              height: size.height / 3.5,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('assets/IMG_0934.jpg'),
                              ),
                              SizedBox(
                                width: 10,
                              ),

                              Text('Mohammed',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              Text('Ayeduase')
                            ],
                          ),
                           FocusedMenuHolder(
                            menuItems: [
                              FocusedMenuItem(
                                title: Text('Name:'),
                                 onPressed: (){},),

                              FocusedMenuItem(
                                title: Text('Contact:'),
                                 onPressed: (){},),

                              FocusedMenuItem(
                                title: Text('age:'),
                                 onPressed: (){},)
                            ],
                             onPressed: (){},
                             openWithTap: true,
                             child: Text(
                              'View more',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                             ),
                           )
                        ],
                      ),
                    ),
                  ),
                   Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   ElevatedButton(
                    child: const Text(
                      'Decline',
                      // style: TextStyle(fontSize: 10),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15.0),
                        ),
                        primary: Colors.red.withOpacity(0.5),
                        padding:
                            const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10)),
                    onPressed: () {
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Accept',
                      // style: TextStyle(fontSize: 10),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15.0),
                        ),
                        primary: Colors.blueGrey[200],
                        padding:
                            const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10)),
                    onPressed: () {
                    },
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
    );
  }
}