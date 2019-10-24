import 'package:flutter/material.dart';
import 'package:waschen2x/feedbackThanks.dart';
import 'wardrobe_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'RoundedRectangleField.dart';
import 'RoundButton.dart';
import 'newHome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sign_Up.dart';
import 'feedbackThanks.dart';

class FeedBack extends StatefulWidget {
  static const String id = 'feedback';

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final _fireStore = Firestore.instance;
  String feedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback',
          style: TextStyle(fontFamily: 'Antipasto_Regular'),
        ),
        backgroundColor: Color(0xFFF18287),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '"Feedback',
              style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'Antipasto_Regular',
                  color: Color(0xFFF18287)),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 200.0,
              width: 375.0,
              child: Theme(
                data: ThemeData(
                    splashColor: Color(0xFFF18287),
                    primaryColor: Color(0xFFF18287)),
                child: SizedBox.expand(
                  child: TextField(
                    onChanged: (value) {
                      feedback = value;
                    },
                    maxLines: 99,
                    cursorColor: Color(0xFFF18287),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: TextStyle(
                            color: Color(0xFFF18287),
                            fontFamily: 'Antipasto_Regular',
                            fontSize: 20.0),
                        hintText: 'Send us your valuable feedback',
                        fillColor: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 64.0),
            ButtonTheme(
              minWidth: 123.0,
              height: 45.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                color: Color(0xFFF18287),
                onPressed: () async {
                  _fireStore.collection('Feedback').add({
                    'Feedback': feedback,
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackThanks()),
                  );
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                      fontFamily: 'Antipasto_Regular',
                      color: Colors.white,
                      fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
