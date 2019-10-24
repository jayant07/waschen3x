import 'package:flutter/material.dart';
import 'RoundedRectangleField.dart';
import 'newHome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditNow extends StatefulWidget {
  @override
  _EditNowState createState() => _EditNowState();
}

class _EditNowState extends State<EditNow> {
  void _updateData(selectedDoc, newValues) async {
    await Firestore.instance
        .collection('UserInfo')
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e) {
      print(e);
    });
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
      appBar: AppBar(
        backgroundColor: Color(0xFFF18287),
        title: Text('Update Info'),
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
                'We use your info to generate a membership card for hasslefree service experience and extra benifits',
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
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
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
