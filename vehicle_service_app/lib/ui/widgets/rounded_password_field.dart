import 'package:flutter/material.dart';
import 'package:vehicle_service_app/config/constants.dart';
import 'package:vehicle_service_app/ui/widgets/widgets.dart';


class RoundedPasswordField extends StatefulWidget {
  const RoundedPasswordField({ Key? key }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {

  late bool showText;
  
  @override
  void initState() {
    super.initState();
    showText = true;
  }

  void onSuffixIconTapped(){
    setState(() {
      showText = !showText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: showText,
        cursorColor: kPrimaryColor,
         decoration:  InputDecoration(
            icon: const Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            hintText: "Password",
            hintStyle:  const TextStyle(fontFamily: 'OpenSans'),
            suffixIcon: IconButton(
              icon: const Icon(Icons.visibility),
              color: kPrimaryColor,
              onPressed: onSuffixIconTapped
            ),
            border: InputBorder.none),
      ),
    );
  }
}