import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_service_app/ui/widgets/rounded_input_field.dart';
import 'package:image_picker/image_picker.dart';

class updateProfile extends StatefulWidget {
  updateProfile({Key? key}) : super(key: key);

  @override
  State<updateProfile> createState() => _updateProfileState();
}

class _updateProfileState extends State<updateProfile> {
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
      await users.add({
        'id': loggeduser.uid,
        'name': name,
        'phone': phone,
        'nationalid': nationalID,
        'profileImg': urlDownload,
      });
    }

    void profileUpdate() {
      loggeduser.updateDisplayName(name.text);
      loggeduser.updatePhotoURL(urlDownload);
    }

    return Material(
      child: Form(
        child: SafeArea(
          child: Column(children: [
            const SizedBox(
              height: 10.0,
            ),
            Container(
              child: const Text(
                'Complete Registration',
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
                    ? FileImage(_image!) as ImageProvider
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
            ElevatedButton(
                onPressed: () {
                  //validate
                  //profile image upload
                  upload();
                  //sending data to db
                  adduser();
                  //
                  profileUpdate();

                  Navigator.pop(context);
                },
                child: const Text("Save"))
          ]),
        ),
      ),
    );
  }
}
