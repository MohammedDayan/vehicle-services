import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_service_app/ui/dashboard.dart';
import 'package:vehicle_service_app/ui/screens/carOwnerView.dart';
import 'package:vehicle_service_app/ui/screens/login_screen.dart';
import 'package:vehicle_service_app/ui/widgets/rounded_input_field.dart';
import 'package:image_picker/image_picker.dart';

class addBranch extends StatefulWidget {
  addBranch({Key? key}) : super(key: key);

  @override
  State<addBranch> createState() => _addBranchState();
}

class _addBranchState extends State<addBranch> {
  final _formKey = GlobalKey<FormState>();
  final branchName = TextEditingController();
  final branchPhone = TextEditingController();
  final gps = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loggeduser = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('user');

    Future<void> addBranch() async {
      await users.add({
        'branchName': branchName.text,
        'gps': gps.text,
        'branchPhone': branchPhone.text,
      }).then((value) => print('data uploaded to firebase database'));
    }

    return Material(
      child: Form(
        child: SafeArea(
          child: ListView(children: [
            const SizedBox(
              height: 10.0,
            ),
            Container(
              child: const Center(
                child: Text(
                  'Add Branch(s)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            RoundedInputField(
              controller: branchName,
              icon: Icons.label,
              hintText: "Name",
            ),
            RoundedInputField(
              controller: branchPhone,
              icon: Icons.phone,
              hintText: "Phone",
            ),
            RoundedInputField(
              controller: gps,
              icon: Icons.local_activity,
              hintText: "Gps",
            ),
            ElevatedButton(
                onPressed: () {
                  addBranch().then((value) => {
                        // Navigator.pop(context)
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const carOwnersView())),
                      });

                  //
                },
                child: const Text("Save"))
          ]),
        ),
      ),
    );
  }
}
