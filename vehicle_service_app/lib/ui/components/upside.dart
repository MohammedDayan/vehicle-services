import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_service_app/config/constants.dart';
import 'package:lottie/lottie.dart';

class Upside extends StatelessWidget {
  const Upside({Key? key, required this.imgUrl}) : super(key: key);
  final LottieBuilder imgUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height / 2,
          //color: kPrimaryColor,
          //color: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            // child: Image.asset(
            //   imgUrl,
            //   alignment: Alignment.topCenter,
            //   scale: 8,
            // ),
            child: imgUrl,
          ),
        ),
        iconBackButton(context),
       
      ],
    );
  }
}

iconBackButton(BuildContext context) {
  return IconButton(
    color: Colors.white,
    iconSize: 28,
    icon: const Icon(CupertinoIcons.arrow_left),
    onPressed: (){
      Navigator.pop(context);
    },
  );
}
