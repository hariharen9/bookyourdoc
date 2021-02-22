import 'package:bookyourdoc/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'authentication_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Booking extends StatefulWidget {
  @required
  const Booking({Key key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    final TextEditingController date = TextEditingController();
    final TextEditingController details = TextEditingController();
    final TextEditingController time = TextEditingController();
    final TextEditingController dept = TextEditingController();
    final TextEditingController problems = TextEditingController();

    void _book() async {
      try {
        await firestore.collection("patients").doc().set({
          "details": details.text,
          "date": date.text,
          "time": time.text,
          "department": dept.text,
          "problem": problems.text,
        });
      } catch (e) {
        print(e);
      }
    }

    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Booking',
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
                    children: [
                      Text(
                        'Please Enter the requested details below in the CORRECT FORM :',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 100,
                        width: 450,
                        child: TextField(
                          style: TextStyle(color: Colors.black87),
                          controller: details,
                          decoration: InputDecoration(
                            hintText: "Details",
                            labelText: "Enter your NAME & AGE",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 450,
                        child: TextField(
                          style: TextStyle(color: Colors.black87),
                          controller: date,
                          decoration: InputDecoration(
                            hintText: "DATE",
                            labelText: "Enter your desired date (DD:MM:YYYY)",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 450,
                        child: TextField(
                          style: TextStyle(color: Colors.black87),
                          controller: time,
                          decoration: InputDecoration(
                            hintText: "Time",
                            labelText: "Enter your desired time (HH:MM)",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 450,
                        child: TextField(
                          style: TextStyle(color: Colors.black87),
                          controller: dept,
                          decoration: InputDecoration(
                            hintText: "DOCTOR",
                            labelText: "Enter your desired Doctor (Department)",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
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
                                "What are the problems you are facing? please SHARE IT WITH US",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: _book,
                        child: Text(
                          "BookMyDOC NOW!",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        child: IconButton(
                            icon: FaIcon(FontAwesomeIcons.angleDown),
                            onPressed: () {
                              print("Pressed");
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthenticationService>().signOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignInPage();
                              },
                            ),
                          );
                        },
                        child: Text("Sign OUT"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
