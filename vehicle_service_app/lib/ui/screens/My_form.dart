import 'package:flutter/material.dart';
import 'package:vehicle_service_app/config/constants.dart';
import 'package:intl/intl.dart';

final startDate = TextEditingController();
final returnDate = TextEditingController();

class OrderForm extends StatefulWidget {
  const OrderForm({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  TextEditingController _date = TextEditingController();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AppBar(
                  leading: Icon(Icons.verified_user),
                  elevation: 0,
                  title: Text('Booking Details'),
                  backgroundColor:
                      kPrimaryColor, //Theme.of(context).accentColor,
                  centerTitle: true,
                ),

                Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 20),
                  child: TextFormField(
                    controller: _date,
                    cursorColor: kPrimaryColor,
                    /*initialValue: widget.user.fullName,
                    onSaved: (val) => widget.user.fullName = val,
                    */
                    validator: (val) =>
                        val!.length > 3 ? null : ' Date cant be null',
                    decoration: const InputDecoration(
                      labelText: 'Start Date',
                      hintText: 'Select start date',
                      icon: Icon(Icons.calendar_month),
                      isDense: true,
                      border: UnderlineInputBorder(),
                    ),
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));

                      if (pickeddate != null) {
                        setState(() {
                          _date.text =
                              DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                  child: TextFormField(
                    controller: returnDate,
                    /* initialValue: widget.user.email,
                    onSaved: (val) => widget.user.email = val,
                    validator: (val) =>
                        val.contains('@') ? null : 'Email is invalid',*/
                    validator: (val) =>
                        val!.length > 3 ? null : ' Date cant be null',
                    decoration: const InputDecoration(
                      labelText: 'Return Date',
                      hintText: 'Select Return date',
                      icon: Icon(Icons.calendar_month),
                      isDense: true,
                    ),
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));

                      if (pickeddate != null) {
                        setState(() {
                          _date.text =
                              DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  child: TextFormField(
                    enabled: false,
                    /* initialValue: widget.user.email,
                    onSaved: (val) => widget.user.email = val,
                    validator: (val) =>
                        val.contains('@') ? null : 'Email is invalid',*/
                    decoration: InputDecoration(
                      labelText: 'Pickup Location',
                      hintText: 'Your Pickup location is' + '',
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
                      labelText: 'Return location',
                      hintText: 'Enter Return Location',
                      icon: Icon(Icons.location_on),
                      isDense: true,
                    ),
                  ),
                ),

                //   Padding(
                //   padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                //   child: TextFormField(
                //    /* initialValue: widget.user.email,
                //     onSaved: (val) => widget.user.email = val,
                //     validator: (val) =>
                //         val.contains('@') ? null : 'Email is invalid',*/
                //     decoration: InputDecoration(
                //       labelText: 'Pickup location',
                //       hintText: 'Enter your pickup location',
                //       icon: Icon(Icons.location_on),
                //       isDense: true,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
