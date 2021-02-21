import 'package:bookyourdoc/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  height: 100,
                ),
                Text('CRUD operations'),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("fetch"),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("add"),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("Update"),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: () {},
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
