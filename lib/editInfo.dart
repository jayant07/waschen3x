import 'dart:math';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:waschen2x/editNow.dart';
import 'getUserInfo.dart';
import 'schedulePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'newHome_screen.dart';
import 'RoundButton.dart';

class EditInfo extends StatefulWidget {
  EditInfo({this.email});

  final String email;

  @override
  _EditInfoState createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  final _fireStore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  static const String id = 'update_info';
  String address;
  String username;
  String phone;
  String birthday;
  bool showSpinner = false;
  bool reviewFlag = false;
  var UserInfo;
  String user;

  @override
  void initState() {
    super.initState();
    readInfo();
  }

  void readInfo() {
//    StreamBuilder(
//      stream: Firestore.instance.collection('UserInfo').snapshots(),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) {
//          return Text('please wait..');
//        }
//        return ListView.builder(itemBuilder: (context, index){
//          return snapshot.data.documents[index];
//        });
//      },
//    );
    GetInfo().getUserInfo('${widget.email}').then((QuerySnapshot docs) {
      if (docs.documents[0] != null) {
        setState(() {
          reviewFlag = true;
          UserInfo = docs.documents[0].data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF18287),
        title: Text('User Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'User Info',
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Antipasto_Bold',
                    color: Color(0xFFF18287),
                  ),
                ),
                Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('images/edit.png'))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFF18287),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.account_circle,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Username : ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
//                                          Text(
//                                            UserInfo['username'],
//                                            style: TextStyle(
//                                              color: Colors.white,
//                                            ),
//                                          ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.home,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Address : ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
//                                            Expanded(
//                                              child: Text(
//                                                UserInfo['address'],
//                                                maxLines: 3,
//                                                overflow: TextOverflow.ellipsis,
//                                                textAlign: TextAlign.start,
//                                                style: TextStyle(
//                                                  color: Colors.white,
//                                                ),
//                                              ),
//                                            ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Phone : ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
//                                          Text(
//                                            UserInfo['phone'],
//                                            style: TextStyle(
//                                              color: Colors.white,
//                                            ),
//                                          ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.cake,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Birthday : ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
//                                          Text(
//                                            UserInfo['birthday'],
//                                            style: TextStyle(
//                                              color: Colors.white,
//                                            ),
//                                          ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: reviewFlag
                                  ? Text(
                                      UserInfo['username'],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat_Medium',
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    )
                                  : Text('Please wait...'),
                            ),
                            reviewFlag
                                ? Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      UserInfo['address'],
                                      textAlign: TextAlign.start,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat_Medium',
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                  )
                                : Text('Please wait...'),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: reviewFlag
                                  ? Text(
                                      UserInfo['phone'],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat_Medium',
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    )
                                  : Text('Please wait...'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: reviewFlag
                                  ? Text(
                                      UserInfo['birthday'],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat_Medium',
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    )
                                  : Text('Please wait...'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xFFF18287),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50)),
              child: MaterialButton(
                child: Text(
                  'Edit',
                  style: TextStyle(
                    fontFamily: 'Antipasto_light',
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditNow()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
