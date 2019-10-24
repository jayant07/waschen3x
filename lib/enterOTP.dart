import 'package:flutter/material.dart';
import 'wardrobe_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'RoundedRectangleField.dart';
import 'RoundButton.dart';
import 'squareBox.dart';
import 'main.dart';

class EnterOtp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Enter OTP',
            style: TextStyle(
                fontSize: 70.0,
                fontFamily: 'Antipasto_Regular',
                color: Color(0xFFF18287)),
          ),
          SizedBox(
            height: 64.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              squareOTP(),
              SizedBox(width: 10.0),
              squareOTP(),
              SizedBox(width: 10.0),
              squareOTP(),
              SizedBox(width: 10.0),
              squareOTP(),
            ],
          ),
          SizedBox(height: 200.0),
          ButtonTheme(
            minWidth: 123.0,
            height: 45.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              color: Color(0xFFF18287),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WardrobePage()),
                );
              },
              child: Text(
                'Confirm OTP',
                style: TextStyle(
                    fontFamily: 'Antipasto_Regular',
                    color: Colors.white,
                    fontSize: 20.0),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
