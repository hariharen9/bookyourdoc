import 'package:bookyourdoc/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'package:google_fonts/google_fonts.dart';

import 'booking.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController problems = TextEditingController();
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
          backgroundColor: Colors.white70,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'HOME',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              Text(
                'BookYourDoc',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/white.jpg'),
                    fit: BoxFit.cover)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome To BOOKYOURDOC',
                      style: TextStyle(color: Colors.black87, fontSize: 30),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Departments Availale:',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            height: 200,
                            width: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/doctors/1.jpg'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 200,
                            width: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/doctors/2.jpg'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 200,
                            width: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/doctors/3.jpg'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 200,
                            width: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/doctors/4.jpg'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 200,
                            width: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/doctors/5.jpg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 100,
                      width: 450,
                      child: TextField(
                        style: TextStyle(color: Colors.black87),
                        controller: problems,
                        decoration: InputDecoration(
                          hintText: "Enter your Comments",
                          labelText:
                              "What are the problems you are facing? \nSHARE IT WITH US",
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Proceed further and :',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.read<AuthenticationService>().signOut();
                          },
                          child: Text(
                            "Sign OUT",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          child: Text(
                            'Book-A-DOC',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Booking();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
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
