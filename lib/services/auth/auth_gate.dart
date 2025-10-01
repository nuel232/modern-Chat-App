import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modern_chat_app/pages/home_page.dart';
import 'package:modern_chat_app/pages/nav_bar.dart';
import 'package:modern_chat_app/services/auth/loginOrRegister.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //user has logged in
        if (snapshot.hasData) {
          return NavBar();
        }
        //Not logged in
        else {
          return LoginOrRegister();
        }
      },
    );
  }
}
