import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imagePicker extends StatefulWidget {
  imagePicker({Key? key}) : super(key: key);

  @override
  State<imagePicker> createState() => _imagePickerState();
}

class _imagePickerState extends State<imagePicker> {
  File? _image;
  final _picker = ImagePicker();

  Future<void> _openimagePicker() async {
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
    return Container();
  }
}
