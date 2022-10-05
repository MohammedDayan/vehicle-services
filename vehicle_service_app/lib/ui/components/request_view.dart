import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

var userDocId;
final loggeduser = FirebaseAuth.instance.currentUser!;
FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference users = firestore.collection('user');

class manageRequest extends StatefulWidget {
  var userdata;

  manageRequest({Key? key}) : super(key: key);

  // final Query<Map<String, dynamic>> _OrderStream = FirebaseFirestore.instance
  //     .collection('orders')
  //     .where('ownerid', isEqualTo: loggeduser.uid);

  getuserinfo() async {
    print('logged user id' + loggeduser.uid);
    final snap = await users.where("id", isEqualTo: loggeduser.uid);
    snap.get().then((value) => {
          userdata = value.docs[0].data(),
          print('data from firebase db ' + userdata.toString()),
          print('data from firebas one field ' + userdata['phone'].toString()),
          print(userdata['docId']),
          userDocId = userdata['docId'],
        });
  }

  @override
  State<manageRequest> createState() => _manageRequestState();
}

class _manageRequestState extends State<manageRequest> {
  // var userDocId = widget.userDocId;
  // print('before Stream var start')

  void initState() {
    print('Inint startsssss');
    widget.getuserinfo();
  }

  final Stream<QuerySnapshot> _orderStream = FirebaseFirestore.instance
      .collection('users')
      .doc(userDocId)
      .collection('orders')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: _orderStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasData != true) {
            return Text('You have no requests yet');
          }

          return ListView(
            children: snapshot.data!.docs
                .map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  print('what out !!!' + data['name']);
                  return Container(
                    padding: EdgeInsets.only(top: 10),
                    height: size.height / 3.5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    //width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[300],
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.blueGrey.withOpacity(0.2))),
                          ),
                          child: ListTile(
                            //car details here
                            //textColor: Colors.red,
                            //shape: Border.all(width: 1, color: Colors.grey),
                            title: Text('Jaguar'),
                            leading: Image.asset('assets/jaguar.jpg'),
                            subtitle: Text('Pirana 2000'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.blueGrey.withOpacity(0.2))),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    //some of user datails here
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(
                                        data['customerImg'],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),

                                    Text(
                                      data['name'],
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on),
                                    Text('Ayeduase')
                                  ],
                                ),
                                FocusedMenuHolder(
                                  menuItems: [
                                    //more of user details here
                                    FocusedMenuItem(
                                      title: Text('Name:'),
                                      onPressed: () {},
                                    ),
                                    FocusedMenuItem(
                                      title: Text('Contact:'),
                                      onPressed: () {},
                                    ),
                                    FocusedMenuItem(
                                      title: Column(children: [
                                        Text('age:'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Image.network('')
                                      ]),
                                      onPressed: () {},
                                    )
                                  ],
                                  onPressed: () {},
                                  openWithTap: true,
                                  child: Text(
                                    'View more',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                child: const Text(
                                  'Decline',
                                  // style: TextStyle(fontSize: 10),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    primary: Colors.red.withOpacity(0.5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10)),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                child: const Text(
                                  'Accept',
                                  // style: TextStyle(fontSize: 10),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    primary: Colors.blueGrey[200],
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10)),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                })
                .toList()
                .cast(),
          );
        });
  }
}
