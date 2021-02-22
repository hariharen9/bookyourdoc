import 'package:bookyourdoc/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'booking.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController problems = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
                style: TextStyle(color: Colors.black26),
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
                child: SingleChildScrollView(
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
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 250,
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
                              width: 250,
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
                              width: 250,
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
                              width: 250,
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
                              width: 250,
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
                            labelText: "Do you want to SHARE anything with us?",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: IconButton(
                                icon: FaIcon(FontAwesomeIcons.handshake),
                                onPressed: () {
                                  print("Pressed");
                                }),
                          ),
                          Text(
                            'Proceed further and :',
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 18),
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
