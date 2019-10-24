import 'package:flutter/material.dart';
import 'wardrobe_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'RoundedRectangleField.dart';
import 'RoundButton.dart';
import 'newHome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sign_Up.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdateInfo extends StatefulWidget {
  static const String id = 'UpdateInfo';

  @override
  _UpdateInfoState createState() => _UpdateInfoState();
}

class _UpdateInfoState extends State<UpdateInfo> {
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user == user) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  final _auth = FirebaseAuth.instance;
  final _fireStore = Firestore.instance;

  static const String id = 'update_info';

  FirebaseUser loggedInUser;
  String address;
  String username;
  String phone;
  String email;
  String birthday;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          'Update info',
          style: TextStyle(fontFamily: 'Antipasto_Regular'),
        ),
        backgroundColor: Color(0xFFF18287),
      ),
      body: Center(
        child: Container(
          width: 350.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40.0),
              Text(
                'LAUNDRY INFO',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 60.0,
                    fontFamily: 'Antipasto_Regular',
                    color: Color(0xFFF18287)),
              ),
              SizedBox(height: 10.0),
              Text(
                'We will use your info to generate a membership card for hasslefree service experience and extra benifits',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Antipasto_Regular',
                    color: Colors.black26),
              ),
              SizedBox(
                height: 64.0,
              ),
              RoundedTextField(
                  onChanged: (value) {
                    username = value;
                  },
                  icon: Icon(Icons.person),
                  keyboardType: TextInputType.text,
                  hintText: 'username'),
              RoundedTextField(
                  onChanged: (value) {
                    phone = value;
                  },
                  icon: Icon(Icons.phone),
                  keyboardType: TextInputType.number,
                  hintText: 'phone no.'),
              RoundedTextField(
                  onChanged: (value) {
                    address = value;
                  },
                  icon: Icon(Icons.location_on),
                  keyboardType: TextInputType.text,
                  hintText: 'address'),
              RoundedTextField(
                  onChanged: (value) {
                    birthday = value;
                  },
                  icon: Icon(Icons.cake),
                  keyboardType: TextInputType.datetime,
                  hintText: '--/--/----'),
              SizedBox(
                height: 64.0,
              ),
              ButtonTheme(
                minWidth: 123.0,
                height: 45.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  color: Color(0xFFF18287),
                  onPressed: () async {
                    _fireStore.collection('UserInfo').add({
                      'username': username,
                      'phone': phone,
                      'address': address,
                      'email': loggedInUser.email,
                      'birthday': birthday,
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Text(
                    'Save',
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
      ),
    );
  }
}
