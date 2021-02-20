import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookyourdoc/authentication_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //for google sign in

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newemailController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final firebaseAuthenticationService = FirebaseAuthenticationService();
  String emailvalue;
  String passvalue;

  Future _createEmailAccount() async {
    final result = await firebaseAuthenticationService.createAccountWithEmail(
        email: newemailController.text, password: newpasswordController.text);
    print('Result: ${result.uid}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[400],
        title: Text('BookYourDoc'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'WELCOME TO BOOK-YOUR-DOC',
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                  labelText: "Email",
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  labelText: "Password",
                ),
              ),
              RaisedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                },
                child: Text("Sign IN"),
              ),
              //SizedBox(height: 20, width: 100),
              TextField(
                controller: newemailController,
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                  labelText: "Email",
                ),
              ),
              TextField(
                controller: newpasswordController,
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  labelText: "Password",
                ),
              ),
              RaisedButton(
                onPressed: _createEmailAccount,
                child: Text("Sign UP"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}