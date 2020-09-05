import 'package:flutter/material.dart';
import 'package:my_app/pages/utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              FlatButton(
                splashColor: Colors.blue,
                focusColor: Colors.blue,
                textColor: Colors.blue,
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.blue)),
                onPressed: handleSignIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
