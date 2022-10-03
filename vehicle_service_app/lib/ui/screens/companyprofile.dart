import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_service_app/ui/dashboard.dart';
import 'package:vehicle_service_app/ui/screens/Branches.dart';
import 'package:vehicle_service_app/ui/screens/login_screen.dart';
import 'package:vehicle_service_app/ui/widgets/rounded_input_field.dart';
import 'package:image_picker/image_picker.dart';

class companyProfile extends StatefulWidget {
  companyProfile({Key? key}) : super(key: key);

  @override
  State<companyProfile> createState() => _companyProfileState();
}

class _companyProfileState extends State<companyProfile> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  final nationalID = TextEditingController();
  final tin = TextEditingController();
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
    }
  }

  File? _imageLisence;
  var _imgNameLisence;

  void _openimagePickerLisence() async {
    const String url = 'businessLicenseimg/';
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
      await users.add({
        'id': loggeduser.uid,
        'name': name.text,
        'phone': phone.text,
        'nationalid': nationalID.text,
        'Tin': tin.text,
        'profileImg': urlDownloadProf,
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
              hintText: "National ID No of business Owner",
            ),
            RoundedInputField(
              controller: tin,
              icon: Icons.location_city,
              hintText: "Tax Identification No (TIN)",
            ),
            // RoundedInputField(
            //   controller: gps,
            //   icon: Icons.maps_home_work,
            //   hintText: "Current Address ",
            // ),
            // RoundedInputField(
            //   controller: gps,
            //   icon: Icons.maps_home_work,
            //   hintText: "State Branches if any ",
            // ),
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
                            : AssetImage('assets/images/businessCert.png'),
                      ),
                    ),
                    child: Text("Tap to upload Image of License of Business "),
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
                                builder: (context) => manageBranches())),
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
                  if (url == 'businessLicenseimg/')
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
