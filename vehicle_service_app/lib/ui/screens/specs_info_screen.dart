import 'package:flutter/material.dart';
import 'package:vehicle_service_app/config/constants.dart';
import 'package:vehicle_service_app/model/car.dart';
import 'package:vehicle_service_app/ui/recentcars.dart';
import 'package:vehicle_service_app/ui/screens/manage_car_screen.dart';
import 'package:vehicle_service_app/ui/screens/mycars.dart';

class SpecsForm extends StatelessWidget {
  const SpecsForm({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
