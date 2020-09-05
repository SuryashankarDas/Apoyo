import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/pages/splash.dart';
import 'package:my_app/pages/utils.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        currentUser = account;
      });
    });
    signInSilent();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      print("error");
    }
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      home: (!_initialized)
          ? SplashScreen()
          : ((currentUser == null) ? LoginPage() : HomePage()),
    );
  }
}
