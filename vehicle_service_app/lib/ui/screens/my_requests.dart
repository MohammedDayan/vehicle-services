import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:vehicle_service_app/ui/recentcars.dart';
import 'package:vehicle_service_app/model/car.dart';
import 'package:vehicle_service_app/ui/screens/mycars.dart';
import 'package:vehicle_service_app/ui/screens/preview_screen.dart';

import '../components/orderPrice.dart';

class myRequests extends StatefulWidget {
  @override
  State<myRequests> createState() => _myRequestsState();
}

Widget _buildCarList(BuildContext context, Car recentimg) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: FocusedMenuHolder(
      menuItems: [
        FocusedMenuItem(
          title: Text(
            'Cancel Order',
            style: TextStyle(color: Colors.white),
          ),
          trailingIcon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          onPressed: () {},
          backgroundColor: Colors.red.withOpacity(0.5),
        )
      ],
      blurBackgroundColor: Colors.blueGrey[900],
      menuOffset: 10,
      openWithTap: true,
      onPressed: () {},
      duration: Duration(seconds: 1),
      child: Material(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2),
          child: ListTile(
            //textColor: Colors.red,
            shape: Border.all(width: 1, color: Colors.grey),
            title: Text(recentimg.name),
            leading: Image.network(recentimg.imgurl),
            subtitle: Text(recentimg.descip),
          ),
        ),
      ),
    ),
  );
}

class _myRequestsState extends State<myRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          shadowColor: Colors.white,
          foregroundColor: const Color.fromARGB(255, 2, 32, 56),
          title: const Text(
            "Manage your requests",
            style: TextStyle(
              color: Color.fromRGBO(1, 48, 87, 1),
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: recentimg.length,
            itemBuilder: (context, index) =>
                _buildCarList(context, recentimg[index])));
  }
}
