import 'package:flutter/material.dart';
import 'newHome_screen.dart';
import 'sign_Up.dart';
import 'Feedback.dart';
import 'InstantConfirmationPage.dart';
import 'schedulePage.dart';
import 'update_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'rootPage.dart';

void main() => runApp(Waschen());

class Waschen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
          textTheme: TextTheme(
            body1: TextStyle(color: Colors.black54),
          ),
        ),
        home: HomeScreen(),
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          FeedBack.id: (context) => FeedBack(),
          ConfirmationPage.id: (context) => ConfirmationPage(),
          SchedulePage.id: (context) => SchedulePage(),
          UpdateInfo.id: (context) => UpdateInfo(),
        });
  }
}
