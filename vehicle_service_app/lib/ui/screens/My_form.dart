import 'package:flutter/material.dart';


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
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(Icons.verified_user),
                elevation: 0,
                title: Text('Order Details'),
                backgroundColor: Theme.of(context).accentColor,
                centerTitle: true,
                
              ),

               Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  /*initialValue: widget.user.fullName,
                  onSaved: (val) => widget.user.fullName = val,
                  validator: (val) =>
                      val.length > 3 ? null : 'Full name is invalid',*/
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter your full name',
                    icon: Icon(Icons.person),
                    isDense: true,
                  ),
                ),
              ),

               Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
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
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
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
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
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
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
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



            ],
          ),
        ),
      ),
    );
      }

}