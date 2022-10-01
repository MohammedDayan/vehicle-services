import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../ui/recentcars.dart';
import '../ui/screens/preview_screen.dart';

class allcars extends StatefulWidget {
  allcars({Key? key}) : super(key: key);

  @override
  State<allcars> createState() => _allcarsState();
}

class _allcarsState extends State<allcars> {
  final Stream<QuerySnapshot> _CarStream =
      FirebaseFirestore.instance.collection('Cars').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: const Color.fromARGB(255, 2, 32, 56),
          title: const Text(
            "Find a car to Rent",
            style: TextStyle(
              color: Color.fromRGBO(1, 48, 87, 1),
            ),
            textAlign: TextAlign.right,
          ),
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder(
            stream: _CarStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return ListView(
                children: snapshot.data!.docs
                    .map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return ListTile(
                          title: Text(data['name']),
                          leading: Image.network(data['imgurl']),
                          subtitle: Text(data['descip']),
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MyOrder(

                            //             )));
                          });
                    })
                    .toList()
                    .cast(),
              );
            }));
  }
}
