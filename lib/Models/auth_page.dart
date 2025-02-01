import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xblog/Auth/login_sect.dart';
import 'package:xblog/Home/home.dart';
import 'package:xblog/main.dart';


class AuthSect extends StatelessWidget {
  const AuthSect({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //USER LOGGED IN
          if (snapshot.hasData) {
            return Home();
          }

          //USER IS NOT LOGGED IN
          else {
            return LoginSect();
          }
        },
      ),
    );
  }
}
