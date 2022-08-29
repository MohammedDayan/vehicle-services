import 'package:flutter/material.dart';
import 'package:vehicle_service_app/config/constants.dart';


class OrderForm extends StatelessWidget {
  const OrderForm({ Key? key,}) : super(key: key);

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
              )
            )
          ),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AppBar(
                  leading: Icon(Icons.verified_user),
                  elevation: 0,
                  title: Text('Booking Details'),
                  backgroundColor: kPrimaryColor,//Theme.of(context).accentColor,
                  centerTitle: true,
                  
                ),
        
                 Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16,bottom: 20),
                  child: TextFormField(
                    cursorColor: kPrimaryColor,
                    /*initialValue: widget.user.fullName,
                    onSaved: (val) => widget.user.fullName = val,
                    validator: (val) =>
                        val.length > 3 ? null : 'Full name is invalid',*/
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'Enter your full name',
                      icon: Icon(Icons.person),
                      isDense: true,
                      border: UnderlineInputBorder(
                        
                      )
        
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
                      labelText: 'Email Address',
                      hintText: 'Enter your email',
                      icon: Icon(Icons.email),
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
                      labelText: 'Start Date',
                      hintText: 'Enter your start date',
                      icon: Icon(Icons.calendar_today),
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
                      labelText: 'Return Date',
                      hintText: 'Enter date your return date',
                      icon: Icon(Icons.calendar_month),
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
                      labelText: 'Pickup location',
                      hintText: 'Enter your pickup location',
                      icon: Icon(Icons.location_on),
                      isDense: true,
                    ),
                  ),
                ),
        
        
        
              ],
            ),
          ),
        ),
      ),
    );
      }

}