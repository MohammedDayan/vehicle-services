import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehicle_service_app/ui/widgets/rounded_input_field.dart';

class myCars extends StatefulWidget {
  const myCars({Key? key}) : super(key: key);

  @override
  State<myCars> createState() => _myCarsState();
}

class _myCarsState extends State<myCars> {
  final _formKey = GlobalKey<FormState>();
  final model = TextEditingController();
  final brand = TextEditingController();
  final insurance_no = TextEditingController();
  final rate = TextEditingController();
  final location = TextEditingController();

  final Vehicle_no = TextEditingController();
  File? _image;
  final _picker = ImagePicker();

  void _openimagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(children: [
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: const Text(
                    'Add Car',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RoundedInputField(
                  controller: model,
                  icon: Icons.label,
                  hintText: "Model",
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
                  controller: rate,
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
                Text("input an image of the car"),
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
                ElevatedButton(onPressed: () {}, child: const Text("Add"))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
