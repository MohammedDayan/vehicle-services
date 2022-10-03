import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:vehicle_service_app/ui/recentcars.dart';
import 'package:vehicle_service_app/model/car.dart';
import 'package:vehicle_service_app/ui/screens/addBranch.dart';
import 'package:vehicle_service_app/ui/screens/mycars.dart';
import 'package:vehicle_service_app/ui/screens/preview_screen.dart';

import '../../model/branch.dart';
import '../components/orderPrice.dart';

List branchesList = [
  Branch(name: "Kumasi", gps: "gps", city: "Kumasi", phone: "0240527371")
];

class manageBranches extends StatefulWidget {
  @override
  State<manageBranches> createState() => _manageBranchesState();
}

Widget _buildBranchList(BuildContext context, Branch branch) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: FocusedMenuHolder(
      menuItems: [
        FocusedMenuItem(
            title: Text('Edit'),
            trailingIcon: Icon(Icons.edit),
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => myCars(),
                  ));
            }),
        FocusedMenuItem(
          title: Text(
            'Delete Branch',
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
            title: Text(branch.name),
            leading: Text(branch.city),
            subtitle: Text(branch.gps),
          ),
        ),
      ),
    ),
  );
}

class _manageBranchesState extends State<manageBranches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          shadowColor: Colors.white,
          actions: [
            Padding(
                padding: EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => addBranch()));
                    },
                    child: Text('Add Branch'))),
          ],
          foregroundColor: const Color.fromARGB(255, 2, 32, 56),
          title: const Text(
            "Manage Branches",
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
                _buildBranchList(context, branchesList[index])));
  }
}
