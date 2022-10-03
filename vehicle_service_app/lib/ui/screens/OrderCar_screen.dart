import 'package:flutter/material.dart';
import 'package:vehicle_service_app/config/constants.dart';
import 'package:intl/intl.dart';

import 'package:vehicle_service_app/ui/widgets/widgets.dart';

class OrderCarScreen extends StatefulWidget {
  const OrderCarScreen({Key? key, required this.car}) : super(key: key);
  final car;

  @override
  State<OrderCarScreen> createState() => _OrderCarScreenState();
}

class _OrderCarScreenState extends State<OrderCarScreen> {
  final startDate = TextEditingController();
  final returnDate = TextEditingController();

  String testing = 'Book car';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text('Make an Order'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
              width: size.width,
              height: size.height,
              color: Colors.white,
              // decoration:  BoxDecoration(
              //  // color: Colors.green.withOpacity(0.5),
              //     image: DecorationImage(
              //   image: AssetImage('assets/jaguar.jpg'),
              //   colorFilter: ColorFilter.mode(Colors.blueGrey, BlendMode.modulate,),
              //   fit: BoxFit.cover,
              // ),),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OrderForm(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                    child: ElevatedButton(
                      child: Text(
                        testing,
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
                        setState(() {
                          testing = widget.car['name'];
                        });
                        addorder();
                      },
                    ),
                  )

                  /* Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child:  RoundedButton(
                  text: 'Book now',
                  )
                )*/
                ],
              )),
        ),
        //foregroundDecoration: ,
      ),
    );
    //);
  }

  void addorder() {}

  Widget OrderForm() {
    Size size = MediaQuery.of(context).size;
    TextEditingController _startdate = TextEditingController();
    TextEditingController _returndate = TextEditingController();

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
                    controller: startDate,
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
                          _startdate.text =
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
                    // validator: (val) =>
                    //     val!.length > 3 ? null : ' Date cant be null',
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
                          _returndate.text =
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
                      labelText: 'Your Pickup location is' + widget.car['city'],
                      icon: const Icon(Icons.location_on),
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
