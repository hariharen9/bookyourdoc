import 'package:bookyourdoc/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: () {
        context.read<AuthenticationService>().signOut();
      },
      child: Text("Sign OUT"),
    );
  }
}

//signout button
/*


              
*/
