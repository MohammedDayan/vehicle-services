import 'package:flutter/material.dart';

class infoUpdate extends StatelessWidget {
  infoUpdate(BuildContext context, {Key? key}) : super(key: key);

  @override
  build(BuildContext context) async {
    TextEditingController _textfieldcontroller = TextEditingController();
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Update Your Info To complete your registration"),
            content: TextField(
              controller: _textfieldcontroller,
              decoration: InputDecoration(hintText: "Input Your Name"),
            ),
            actions: <Widget>[
              ElevatedButton(child: const Text("Update"), onPressed: () {})
            ],
          );
        });
  }
}

_displayDialog(BuildContext context) async {
  TextEditingController _textfieldcontroller = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update Your Info To complete your registration"),
          content: TextField(
            controller: _textfieldcontroller,
            decoration: InputDecoration(hintText: "Input Your Name"),
          ),
          actions: <Widget>[
            ElevatedButton(child: const Text("Update"), onPressed: () {})
          ],
        );
      });
}
