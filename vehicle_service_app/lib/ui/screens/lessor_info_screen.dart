import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_service_app/ui/widgets/rounded_input_field.dart';
import 'package:image_picker/image_picker.dart';

class lessorInfo extends StatefulWidget {
  lessorInfo({Key? key}) : super(key: key);

  @override
  State<lessorInfo> createState() => _lessorInfoState();
}

class _lessorInfoState extends State<lessorInfo> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  final nationalID = TextEditingController();
  final gps = TextEditingController();
  final licenceNo = TextEditingController();
  late final urlDownload;

  File? _image;
  var _imgName;
  final _picker = ImagePicker();

  void _openimagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _imgName = File(pickedImage.name);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loggeduser = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('user');

    Future upload() async {
      final path = 'profilesImg/${_imgName!}';
      final file = _image!;
      final ref = FirebaseStorage.instance.ref().child(path);
      UploadTask uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() => {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Image uploded")))
          });
      urlDownload = await snapshot.ref.getDownloadURL();
    }

    Future<void> adduser() async {
      print("watch out !!!!");
      print(loggeduser.uid);
      print(name.text);
      await users.add({
        'id': loggeduser.uid,
        'name': name.text,
        'phone': phone.text,
        'nationalid': nationalID.text,
        // 'profileImg': urlDownload,
      }).then((value) => print('data uploaded to firebase database'));
    }

    void profileUpdate() {
      loggeduser.updateDisplayName(name.text);
      loggeduser.updatePhotoURL(urlDownload);
    }

    return Material(
      child: Form(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
            const SizedBox(
              height: 10.0,
            ),
            Container(
              child: const Text(
                'upload your picture',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            InkWell(
              onTap: () {
                _openimagePicker();
              },
              child: Center(
                  child: CircleAvatar(
                backgroundImage: _image != null
                    ? FileImage(_image!)
                    : loggeduser.photoURL != null
                        ? NetworkImage(loggeduser.photoURL!) as ImageProvider
                        : const NetworkImage(
                            'https://cdn2.iconfinder.com/data/icons/action-states-vol-4-flat/48/Action___States_-_Vol._4-10-512.png'),
                // Image.file(File(_image?.path))
                radius: 60,
              )),
            ),
            RoundedInputField(
              controller: name,
              icon: Icons.label,
              hintText: "Name",
            ),
            RoundedInputField(
              controller: phone,
              icon: Icons.phone,
              hintText: "Phone",
            ),
            RoundedInputField(
              controller: nationalID,
              icon: Icons.location_city,
              hintText: "National ID No",
            ),
            RoundedInputField(
              controller: gps,
              icon: Icons.gps_fixed,
              hintText: "GPS address",
            ),
            RoundedInputField(
              controller: licenceNo,
              icon: Icons.key,
              hintText: "Driving Licence No",
            ),
             SizedBox(
              height: 30.0,
            ),
            Text(
              "upload national ID or driver's lincense",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            InkWell(
              onTap: () {
                _openimagePicker();
              },
              child: Center(
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: _image != null
                          ? FileImage(_image!) as ImageProvider
                          : const NetworkImage(
                              'https://static.thenounproject.com/png/54657-200.png'),
                      // Image.file(File(_image?.path))
                    ),
                  ),
                ),
              ),
            ),
          
          ]),
        ),
      ),
    );
  }
}
