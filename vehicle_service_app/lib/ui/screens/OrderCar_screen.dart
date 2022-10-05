import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_service_app/config/constants.dart';
import 'package:intl/intl.dart';
import 'package:vehicle_service_app/ui/screens/new_dash.dart';
import 'package:vehicle_service_app/ui/screens/view_location.dart';

import 'package:vehicle_service_app/ui/widgets/widgets.dart';

late var carOwnerDocId;

final loggeduser = FirebaseAuth.instance.currentUser!;
FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference newOrder =
    firestore.collection('user').doc(carOwnerDocId).collection('orders');

class OrderCarScreen extends StatefulWidget {
  var userContact;
  var userdata;

  var userLicense;

  var userLocation;

  OrderCarScreen({Key? key, required this.car}) : super(key: key);
  final car;
  CollectionReference users = firestore.collection('user');

  getuserinfo() async {
    print("uid of carOwner " + car['ownerid']);

    final snap = await users.where("id", isEqualTo: car['ownerid']);
    snap.get().then((value) => {
          userdata = value.docs[0].data(),
          print('data from firebase db ' + userdata.toString()),
          print('data from firebas one field ' + userdata['phone'].toString()),
          carOwnerDocId = userdata['docId'],
          print("car owner document ID" + carOwnerDocId)
        });

    final snap2 = await users.where("id", isEqualTo: loggeduser.uid);
    snap2.get().then((value) => {
          userdata = value.docs[0].data(),
          print('data from firebase db ' + userdata.toString()),
          print('data from firebas one field ' + userdata['phone'].toString()),
          userContact = userdata['phone'],
          userLicense = userdata['LisenceImg'],
          userLocation = userdata['location']
        });
  }

  @override
  State<OrderCarScreen> createState() => _OrderCarScreenState();
}

class _OrderCarScreenState extends State<OrderCarScreen> {
  late String cost;

  late DateTime returnedDate;

  late DateTime Datestarted;

  void initState() {
    print('Inint startsssss');
    widget.getuserinfo();
  }

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

  Widget OrderForm() {
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
                          startDate.text =
                              DateFormat('yyyy-MM-dd').format(pickeddate);
                          Datestarted = pickeddate;
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
                          returnDate.text =
                              DateFormat('yyyy-MM-dd').format(pickeddate);

                          returnedDate = pickeddate;
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

  String calccost() {
    var dur = returnedDate.difference(Datestarted);
    int hourrate = int.parse(widget.car['amount']);

    int frmtdur = dur.inHours;
    var ordcost = (frmtdur * hourrate);
    return ordcost.toString();
  }

  Future<void> addorder() async {
    final info = {
      'id': loggeduser.uid,
      'customerImg': loggeduser.photoURL,
      'name': loggeduser.displayName,
      'phone': widget.userContact,
      'carimg': widget.car['imgurl'],
      'carname': widget.car['name'],
      'descrip': widget.car['descip'],
      'location': widget.car['city'],
    };
    cost = calccost();

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Confirm Order'),
        content: Text(
          "Cost " + cost,
          style: TextStyle(color: Colors.red),
        ),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('CANCEL'),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xfff1bb274))),
            onPressed: () async {
              // upload order details

              SnackBar snackbar = SnackBar(
                  content: Text(
                      "Request Sent.Approval Will be shown in Approved Requests "));
              await newOrder.add(info).then((value) => {
                    print('data uploaded to firebase database'),
                    ScaffoldMessenger.of(context).showSnackBar(snackbar),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeDash())),
                  });
            },
            child: Text('Ok , Proceed'),
          ),
        ],
      ),
    );
  }
}
