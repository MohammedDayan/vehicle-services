import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_service_app/ui/dashboard.dart';
import 'package:vehicle_service_app/ui/screens/login_screen.dart';
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
  late final urlDownloadProf;
  late final urlDownloadLi;

  File? _image;
  var _imgName;
  final _picker = ImagePicker();
  final _pickerLi = ImagePicker();

  void _openimagePicker() async {
    const String url = 'profilesImg/';
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _imgName = File(pickedImage.name);
      });
      upload(_image, _imgName, url);
      print('has download url for prof been initialized?');
      print(urlDownloadProf);
    }
  }

  File? _imageLisence;
  var _imgNameLisence;

  void _openimagePickerLisence() async {
    const String url = 'licenseimg/';
    final XFile? pickedImageLi =
        await _pickerLi.pickImage(source: ImageSource.gallery);

    if (pickedImageLi != null) {
      setState(() {
        _imageLisence = File(pickedImageLi.path);
        _imgNameLisence = File(pickedImageLi.name);
      });
      upload(_imageLisence, _imgNameLisence, url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loggeduser = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('user');

    Future<void> adduser() async {
      final docref = users.doc();

      docref.set({
        'docId': docref.id,
        'id': loggeduser.uid,
        'name': name.text,
        'phone': phone.text,
        'nationalid': nationalID.text,
        'profileImg': urlDownloadProf,
        'location': gps,
        'LisenceImg': urlDownloadLi,
      }).then((value) => print('data uploaded to firebase database'));
    }

    void profileUpdate() {
      loggeduser.updateDisplayName(name.text);
      loggeduser.updatePhotoURL(urlDownloadProf);
    }

    return Material(
      child: Form(
        child: SafeArea(
          child: ListView(children: [
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
                    ? FileImage(_image!)
                    : loggeduser.photoURL != null
                        ? NetworkImage(loggeduser.photoURL!) as ImageProvider
                        : AssetImage('assets/images/profile.png'),
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
              icon: Icons.maps_home_work,
              hintText: "Current Address ",
            ),
            InkWell(
              onTap: () {
                _openimagePickerLisence();
              },
              child: Center(
                child: Builder(builder: (context) {
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: _imageLisence != null
                            ? FileImage(_imageLisence!) as ImageProvider
                            : AssetImage('assets/images/driverLicense.png'),
                      ),
                    ),
                    child: Text("Tap to upload Image of Driver License "),
                  );
                }),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  while (urlDownloadProf == null && urlDownloadLi == null) {
                    const CircularProgressIndicator();
                  }

                  profileUpdate();
                  adduser().then((value) => {
                        // Navigator.pop(context)
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen())),
                      });

                  //
                },
                child: const Text("Save"))
          ]),
        ),
      ),
    );
  }

  upload(value, imgName, String url) async {
    final path = '$url${imgName}';
    final file = value;
    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask uploadTask = ref.putFile(file);
    final snapshot = await uploadTask
        .whenComplete(() async => {
              print('Image upload complete'),
            })
        .then(
          (value) async => {
            await value.ref.getDownloadURL().then((value) => {
                  if (url == 'licenseimg/')
                    {
                      urlDownloadLi = value,
                      print('Linsenceurl inialized with value: ' +
                          urlDownloadProf)
                    }
                  else if (url == "profilesImg/")
                    urlDownloadProf = value,
                  print('profurl inialized with value: ' + urlDownloadProf)
                })
          },
        );
  }
}
