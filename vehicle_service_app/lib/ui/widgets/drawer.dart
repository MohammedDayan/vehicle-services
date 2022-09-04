import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vehicle_service_app/ui/screens/updateprofile.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_service_app/config/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: kPrimaryColor),
                padding: EdgeInsets.all(0),
                child: Container(
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 42,
                        backgroundImage: AssetImage('assets/IMG_0934.jpg'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Mohammed Dayan',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Dayan@gmail.com',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.garage),
                title: const Text('Rent Car'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.inbox,
                ),
                title: const Text('Messages'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: const Text('Starred'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: const Text(
                  'Update Profile',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => updateProfile()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
