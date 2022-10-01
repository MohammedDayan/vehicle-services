import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehicle_service_app/config/constants.dart';
import 'package:vehicle_service_app/model/car.dart';
import 'package:vehicle_service_app/ui/recentcars.dart';
import 'package:vehicle_service_app/ui/screens/My_form.dart';
import 'package:vehicle_service_app/ui/screens/lessor_info_screen.dart';
import 'package:vehicle_service_app/ui/screens/manage_car_screen.dart';
import 'package:vehicle_service_app/ui/screens/specs_info_screen.dart';
import 'package:vehicle_service_app/ui/screens/updateprofile.dart';
import 'package:vehicle_service_app/ui/widgets/rounded_input_field.dart';

class myCars extends StatefulWidget {
  const myCars({Key? key}) : super(key: key);

  @override
  State<myCars> createState() => _myCarsState();
}

class _myCarsState extends State<myCars> with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  var db = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
  final model = TextEditingController();
  final brand = TextEditingController();
  final insurance_no = TextEditingController();
  final vin_no = TextEditingController();
  final location = TextEditingController();
  final description = TextEditingController();
  final speed = TextEditingController();
  final enginType = TextEditingController();
  final mileage = TextEditingController();
  final power = TextEditingController();
  final tankCapacity = TextEditingController();
  final fuelLevel = TextEditingController();
  final amount = TextEditingController();
  final currency = TextEditingController();
  final duration = TextEditingController();

  final Vehicle_no = TextEditingController();
  File? _image;
  final _picker = ImagePicker();

  var _imgName;

  late String carImgUrl;

  void _openimagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    //upload carimg
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _imgName = File(pickedImage.name);
      });
      upload();
    }
  }

  Future upload() async {
    final path = 'CarsImg/${_imgName!}';
    final file = _image!;
    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask uploadTask = ref.putFile(file);
    final snapshot = await uploadTask.whenComplete(() => {});
    carImgUrl = await snapshot.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.black,
            elevation: 0,
            title: Text(
              'Add Car',
            ),
            centerTitle: true,
            bottom: TabBar(
                controller: _tabController,
                unselectedLabelColor: kPrimaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: kPrimaryColor,
                ),
                tabs: [
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: kPrimaryColor, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('GENERAL'),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: kPrimaryColor, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('SPECS'),
                      ),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              ListView(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      RoundedInputField(
                        controller: model,
                        icon: Icons.label,
                        hintText: "Name/Model",
                      ),
                      RoundedInputField(
                        controller: brand,
                        icon: Icons.business,
                        hintText: "Brand",
                      ),
                      RoundedInputField(
                        controller: Vehicle_no,
                        icon: Icons.numbers,
                        hintText: "Vehicle No",
                      ),
                      RoundedInputField(
                        controller: insurance_no,
                        icon: Icons.health_and_safety,
                        hintText: "Insurance No",
                      ),
                      RoundedInputField(
                        controller: vin_no,
                        icon: Icons.numbers,
                        hintText: "VIN / Chassis no",
                      ),
                      RoundedInputField(
                        controller: amount,
                        icon: Icons.attach_money,
                        hintText: "Hourly Rate",
                      ),
                      RoundedInputField(
                        controller: location,
                        icon: Icons.location_pin,
                        hintText: "Current Location of Car",
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        height: 200,
                        width: 300,
                        child: InkWell(
                          onTap: () {
                            _openimagePicker();
                          },
                          child: Center(
                            child: Builder(builder: (context) {
                              return Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    image: _image != null
                                        ? FileImage(_image!) as ImageProvider
                                        : AssetImage(
                                            'assets/images/addcarImg.png'),

                                    // Image.file(File(_image?.path))
                                  ),
                                ),
                                child: Text("Tap to add an image of the car "),
                              );
                            }),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: description,
                          expands: true,
                          maxLines: null,
                          minLines: null,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.description),
                            hintText: 'Description(state faults if any) ',
                            hintStyle: TextStyle(fontFamily: 'OpenSans'),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _tabController.index = 1;
                          },
                          child: const Text("Proceed")),
                      const SizedBox(height: 20),
                    ]),
                  ),
                ],
              ),
              ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.green.withOpacity(0.5),
                      image: DecorationImage(
                        image: AssetImage('assets/jaguar.jpg'),
                        colorFilter: ColorFilter.mode(
                          Colors.blueGrey,
                          BlendMode.modulate,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SpecForm(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  SpecForm() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Theme(
          data: Theme.of(context).copyWith(
              inputDecorationTheme: InputDecorationTheme(
                  focusColor: kPrimaryColor,
                  fillColor: kPrimaryColor,
                  iconColor: kPrimaryColor,
                  labelStyle: TextStyle(
                      // color: kPrimaryColor
                      ))),
          child: Form(
            child: Container(
              color: Colors.blueGrey.withOpacity(0.4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 20),
                    child: TextFormField(
                      controller: speed,
                      cursorColor: kPrimaryColor,
                      /*initialValue: widget.user.fullName,
                      onSaved: (val) => widget.user.fullName = val,
                      validator: (val) =>
                          val.length > 3 ? null : 'Full name is invalid',*/
                      decoration: InputDecoration(
                          labelText: 'Car Speed',
                          hintText: 'Enter the Car speed',
                          icon: Icon(Icons.speed),
                          isDense: true,
                          border: UnderlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                    child: TextFormField(
                      controller: enginType,
                      /* initialValue: widget.user.email,
                      onSaved: (val) => widget.user.email = val,
                      validator: (val) =>
                          val.contains('@') ? null : 'Email is invalid',*/
                      decoration: InputDecoration(
                        labelText: 'Engine type',
                        hintText: 'Enter the Engine type',
                        icon: Icon(Icons.escalator),
                        isDense: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    child: TextFormField(
                      controller: mileage,
                      /* initialValue: widget.user.email,
                      onSaved: (val) => widget.user.email = val,
                      validator: (val) =>
                          val.contains('@') ? null : 'Email is invalid',*/
                      decoration: InputDecoration(
                        labelText: 'Mileage',
                        hintText: 'Enter the Mileage',
                        icon: Icon(Icons.location_city),
                        isDense: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    child: TextFormField(
                      controller: power,
                      /* initialValue: widget.user.email,
                      onSaved: (val) => widget.user.email = val,
                      validator: (val) =>
                          val.contains('@') ? null : 'Email is invalid',*/
                      decoration: InputDecoration(
                        labelText: 'Power',
                        hintText: 'Enter the house power',
                        icon: Icon(Icons.location_on),
                        isDense: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                    child: TextFormField(
                      controller: tankCapacity,
                      /* initialValue: widget.user.email,
                      onSaved: (val) => widget.user.email = val,
                      validator: (val) =>
                          val.contains('@') ? null : 'Email is invalid',*/
                      decoration: InputDecoration(
                        labelText: 'Tank Capacity',
                        hintText: 'Enter the Tank Capacity',
                        icon: Icon(Icons.local_gas_station),
                        isDense: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                    child: TextFormField(
                      /* initialValue: widget.user.email,
                      onSaved: (val) => widget.user.email = val,
                      validator: (val) =>
                          val.contains('@') ? null : 'Email is invalid',*/
                      decoration: InputDecoration(
                        labelText: 'Fuel Level',
                        hintText: 'Enter the current Fuel Level',
                        icon: Icon(Icons.local_gas_station),
                        isDense: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                    child: ElevatedButton(
                      child: const Text(
                        'Lease car',
                        // style: TextStyle(fontSize: 10),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          primary: kPrimaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20)),
                      onPressed: () {
                        recentimg.add(Car(
                            speed: speed.text,
                            tankCapacity: tankCapacity.text,
                            fuelLevel: fuelLevel.text,
                            engineType: enginType.text,
                            millage: mileage.text,
                            power: power.text,
                            brand: brand.text,
                            vin: vin_no.text,
                            insurance: insurance_no.text,
                            name: model.text,
                            imgurl: carImgUrl,
                            descip: description.text,
                            city: location.text,
                            amount: amount.text,
                            currency: 'Ghc',
                            dur: '1'));
                        db.collection("Cars").add({
                          "speed": speed.text,
                          "tankCapacity": tankCapacity.text,
                          "fuelLevel": fuelLevel.text,
                          "engineType": enginType.text,
                          "millage": mileage.text,
                          "power": power.text,
                          "brand": brand.text,
                          "vin": vin_no.text,
                          "insurance": insurance_no.text,
                          "name": model.text,
                          "imgurl": carImgUrl,
                          "descip": description.text,
                          "city": location.text,
                          "amount": amount.text,
                          "currency": 'Ghc',
                          "dur": '1'
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => manageCar(),
                            ));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
