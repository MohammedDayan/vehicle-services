import 'package:flutter/material.dart';
import 'package:vehicle_service_app/ui/screens/branches.dart';
import 'package:vehicle_service_app/ui/screens/companyprofile.dart';

class companyInfo extends StatefulWidget {
  companyInfo({Key? key}) : super(key: key);

  @override
  State<companyInfo> createState() => _companyInfoState();
}

class _companyInfoState extends State<companyInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Center(
            child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => manageBranches()));
                },
                icon: const Icon(Icons.location_city),
                label: const Text("Manage Branches")),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => companyProfile()));
                },
                icon: const Icon(Icons.person),
                label: const Text("Update Profile"))
          ],
        )),
      ),
    );
  }
}
