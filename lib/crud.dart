import 'package:bookyourdoc/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'package:google_fonts/google_fonts.dart';

class Crud extends StatefulWidget {
  Crud({Key key}) : super(key: key);

  @override
  _CrudState createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map data;
  void _create() async {
    try {
      await firestore
          .collection("users")
          .doc("testuser")
          .set({"name": "hari", "mode": "test"});
    } catch (e) {
      print(e);
    }
  }

  void _read() async {
    DocumentSnapshot documentSnapshot;

    try {
      documentSnapshot = await firestore
          .collection('users')
          .doc('testuser')
          .get()
          .then((QueryDocumentSnapshot) => documentSnapshot);
      print(documentSnapshot.data);
    } catch (e) {
      print(e);
    }
  }

  void _update() async {
    try {
      firestore
          .collection('users')
          .doc('testuser')
          .update({"name": "updatedagain"});
    } catch (e) {
      print(e);
    }
  }

  void _delete() async {
    try {
      firestore.collection('users').doc('testuser').delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('HOME'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'CRUD operations',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: _create,
                  child: Text("create"),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: _read,
                  child: Text("read"),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: _update,
                  child: Text("Update"),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: _delete,
                  child: Text("DELETE"),
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthenticationService>().signOut();
                  },
                  child: Text("Sign OUT"),
                )
              ],
            ),
          ),
        ));
  }
}
//signout button
/*
ElevatedButton(
      onPressed: () {
        context.read<AuthenticationService>().signOut();
      },
      child: Text("Sign OUT"),
    );

              
*/

/* Map<String, dynamic> demodata = {"name": "hariharen", "motto": "learning"};

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('data');
    collectionReference.add(demodata);
    */
