// import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vehicle_service_app/ui/widgets/rounded_input_field.dart';
import 'package:image_picker/image_picker.dart';

class createProfile extends StatefulWidget {
  createProfile({Key? key}) : super(key: key);

  @override
  State<createProfile> createState() => _createProfileState();
}

class _createProfileState extends State<createProfile> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  final nationalID = TextEditingController();
  final gps = TextEditingController();
  final licenceNo = TextEditingController();
  late final urlDownloadprofile;
  late final urlDownloadLicense;

  // File? _image;
  late String _timage;
  var _imgName;
  final _picker = ImagePicker();
  // File? _imgLicense;
  final _pickerLicense = ImagePicker();
  var _imgNameLicense;

  late var _urlDownloadprof;

  // Future _openimagePicker() async {
  //   final XFile? pickedImage = await _picker
  //       .pickImage(source: ImageSource.gallery)
  //       .then((value) => uploadimg(File(value!.path)));
  //   if (pickedImage != null) {
  //     setState(() {
  //       // _image = File(pickedImage.path);
  //       _timage = (pickedImage.path);
  //       // _imgName = File(pickedImage.name);
  //     });
  //   }
  // }

  // void _openimagePickerLicense() async {
  //   final XFile? pickedImage =
  //       await _pickerLicense.pickImage(source: ImageSource.gallery);

  //   if (pickedImage != null) {
  //     setState(() {
  //       _imgLicense = File(pickedImage.path);
  //       _imgNameLicense = File(pickedImage.name);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final loggeduser = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('user');

    // Future upload() async {
    //   final path = 'profilesImg/${_imgName!}';
    //   final path2 = 'licenseimg/${_imgNameLicense!}';
    //   final file = _image!;
    //   final file2 = _imgLicense!;
    //   final ref = FirebaseStorage.instance.ref().child(path);
    //   final ref2 = FirebaseStorage.instance.ref().child(path2);

    //   UploadTask uploadTask2 = ref2.putFile(file2);
    //   UploadTask uploadTask = ref.putFile(file);
    //   final snapshot = await uploadTask.whenComplete(() => {
    //         ScaffoldMessenger.of(context)
    //             .showSnackBar(const SnackBar(content: Text("Image uploded")))
    //       });
    //   final snapshot2 = await uploadTask2.whenComplete(() => {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //             const SnackBar(content: Text("Driver License uploded")))
    //       });

    //   urlDownloadprofile = await snapshot.ref.getDownloadURL();
    //   urlDownloadLicense = await snapshot2.ref.getDownloadURL();
    // }

    Future<void> adduser() async {
      print("watch out !!!!");
      print(loggeduser.uid);
      print(name.text);
      await users.add({
        'id': loggeduser.uid,
        'name': name.text,
        'phone': phone.text,
        'nationalid': nationalID.text,
        'profileImg': urlDownloadprofile,
        'LicenseImg': urlDownloadLicense,
      }).then((value) => print('data uploaded to firebase database'));
    }

    void profileUpdate() {
      loggeduser.updateDisplayName(name.text);
      loggeduser.updatePhotoURL(urlDownloadprofile);
    }

    return Material(
      child: SafeArea(
        child: Form(
          child: ListView(
            children: [
              Column(children: [
                const SizedBox(
                  height: 20.0,
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
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () async {
                      //  {_openimagePicker()};
                      // uploadToStorage();
                    },
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: _urlDownloadprof != null
                            ? Image.network(_urlDownloadprof) as ImageProvider
                            : const AssetImage('assets/images/profile.png'),

                        // child: Icon(Icons.people_outline),
                        // backgroundImage:
                        //  _image != null
                        //     ?
                        //     //  FileImage(_image!)
                        //     Image.network(_timage) as ImageProvider
                        //     : loggeduser.photoURL != null
                        //         ? NetworkImage(loggeduser.photoURL!)
                        //             as ImageProvider
                        //         : const AssetImage('assets/images/profile.png'),
                        // // Image.file(File(_image?.path))
                        radius: 60,
                      ),
                    ),
                  ),
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
                Container(
                  height: 200,
                  width: 200,
                  child: InkWell(
                    onTap: () {
                      // _openimagePicker();
                      // upload();
                    },
                    child: Center(
                      child: Builder(builder: (context) {
                        return Container(
                          height: 200,
                          width: 200,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            // image: DecorationImage(
                            //   image: _image != null
                            //       ? FileImage(_image!) as ImageProvider
                            //       : const AssetImage(
                            //           'assets/images/driverLicense.png'),

                            //   // Image.file(File(_image?.path))
                            // ),
                          ),
                          child: Text("Tap to upload Image of Driver License "),
                        );
                      }),
                    ),
                  ),
                ),
                // RoundedInputField(
                //   controller: licenceNo,
                //   icon: Icons.key,
                //   hintText: "Driving Licence No",
                // ),
                ElevatedButton(
                    onPressed: () {
                      //validate
                      //profile image upload

                      //sending data to db
                      adduser();
                      //
                      profileUpdate();

                      Navigator.pop(context);
                    },
                    child: const Text("Save"))
              ]),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  // uploadimg(File img) {
  //   print('working');
  //   const path = 'profilesImg/newimg';
  //   final File file = img;
  //   final ref = FirebaseStorage.instance.ref().child(path);
  //   print(img.path);
  //   UploadTask uploadTask = ref.putFile(img);
  //   final snapshot = uploadTask.whenComplete(() => {
  //         ScaffoldMessenger.of(context)
  //             .showSnackBar(const SnackBar(content: Text("Image uploded")))
  //       });
  // }

  Widget spinner() {
    return const Center(
      child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }

  // uploadImage({required Function(File file) onSelected}) {
  //   InputElement uploadInput = FileUploadInputElement() as InputElement
  //     ..accept = 'image/*';
  //   uploadInput.click();

  //   uploadInput.onChange.listen((event) {
  //     final file = uploadInput.files!.first;
  //     final reader = FileReader();
  //     reader.readAsDataUrl(file);
  //     reader.onLoadEnd.listen((event) {
  //       onSelected(file);
  //       print('done');
  //     });
  //   });
  // }

  // uploadToStorage() {
  //   final dateTime = DateTime.now();
  //   final path = 'profilesImg/${dateTime}';

  //   uploadImage(onSelected: ((file) async {
  //     final ref = FirebaseStorage.instance
  //         .refFromURL('gs://vehicle-services-3c12b.appspot.com/')
  //         .child(path);

  //     UploadTask uploadprof = ref.putBlob(file);
  //     final snapshot = await uploadprof.whenComplete(() => {
  //           ScaffoldMessenger.of(context)
  //               .showSnackBar(const SnackBar(content: Text('profile uploaded')))
  //         });

  //     _urlDownloadprof = await snapshot.ref.getDownloadURL();
  //   }));
  // }
}
