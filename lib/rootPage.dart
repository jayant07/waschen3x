import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:waschen2x/newHome_screen.dart';
import 'sign_Up.dart';
import 'newHome_screen.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;

  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    widget.auth.currentUser().then((userId) {
//      setState(() {
//        authStatus =
//            userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
//      });
//    });
//  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return SignUp(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );

      case AuthStatus.signedIn:
        return HomeScreen(
          auth: widget.auth,
          onSignedOut: _signOut,
        );
    }
  }
}
