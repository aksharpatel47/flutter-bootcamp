import 'package:firebase_auth/firebase_auth.dart';
import 'package:firechat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  static String id = "/";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    final user = await _auth.signInWithCredential(credential);
    print(user.email);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.verified_user),
            onPressed: () {
              Navigator.pushNamed(context, ChatScreen.id);
            },
          ),
        ],
      ),
      body: Center(
        child: MaterialButton(onPressed: () async {
          final user = await _handleSignIn();

          if (user == null) {
            //TODO: Do Something

            return;
          }

          print(user);
          Navigator.pushNamed(context, ChatScreen.id);

        }, child: Text("Login"),),
      )
    );
  }
}
