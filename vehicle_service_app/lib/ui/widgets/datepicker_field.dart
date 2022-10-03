import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_service_app/config/constants.dart';
import 'package:vehicle_service_app/ui/widgets/widgets.dart';

class DatePickerField extends StatelessWidget {
  var controller;
  final Function onTap;

  DatePickerField(
      {Key? key, this.hintText, this.icon = Icons.person, this.controller, required this.onTap})
      : super(key: key);
  final String? hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(fontFamily: 'OpenSans'),
            border: InputBorder.none),
           // onTap: onTap(),
      ),
    );
  }
}
