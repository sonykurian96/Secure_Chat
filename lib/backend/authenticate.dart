import 'package:chattie_ui/backend/loginScreen.dart';
import 'package:chattie_ui/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return MyApp();
    } else {
      return LoginScreen();
    }
  }
}