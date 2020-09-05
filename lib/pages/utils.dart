import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Random random = new Random();

FirebaseFirestore firestore = FirebaseFirestore.instance;
GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

GoogleSignInAccount currentUser;

Future<void> handleSignIn() async {
  try {
    await googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}

void signInSilent() async {
  try {
    await googleSignIn.signInSilently(suppressErrors: false);
  } catch (e) {
    print(e);
  }
}

TextStyle txt = new TextStyle(fontSize: 18);
TextStyle ttl = new TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
