import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'update_info.dart';
import 'getUserInfo.dart';
import 'schedulePage.dart';
import 'package:waschen2x/ThankYouPage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'getUserInfo.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ConfirmOrder extends StatefulWidget {
  ConfirmOrder({this.pickedService, this.timings, this.email});
  final String pickedService;
  final String timings;
  final String email;

  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  final _fireStore = Firestore.instance;
  static const String id = 'update_info';
  String address;
  String username;
  String phone;
  String birthday;
  bool showSpinner = false;
  bool reviewFlag = false;
  var UserInfo;

  @override
  void initState() {
    super.initState();
    GetInfo().getUserInfo('${widget.email}').then((QuerySnapshot docs) {
      if (docs.documents.isNotEmpty) {
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
          title: Text('Confirmation'),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
              Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Text(
                  'Review Order',
                  style: TextStyle(
                      color: Color(0xFFF18287),
                      fontFamily: 'Antipasto_Bold',
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16, 0),
              child: Material(
                elevation: 6.0,
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                    height: 320.0,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  shape: BoxShape.rectangle,
                                  color: Color(0xFFF18287)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.view_list,
                                        size: 20.0,
                                        color: Colors.white,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Order summary',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat_Light',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                reviewFlag
                                    ? Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 20, 8, 8),
                                            child: Text(
                                              "User : ${UserInfo[('username')]}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:
                                                      'Montserrat_light'),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text('please wait...'),
                                reviewFlag
                                    ? Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "email : ${widget.email}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:
                                                      'Montserrat_light'),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text('please wait...'),
                                reviewFlag
                                    ? Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                'phone : ${UserInfo['phone']}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'Montserrat_light')),
                                          ),
                                        ],
                                      )
                                    : Text('please wait...'),
                                reviewFlag
                                    ? Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  'Address : ${UserInfo['address']}',
                                                  textAlign: TextAlign.justify,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'Montserrat_light')),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text('please wait...'),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "Service : ${widget.pickedService}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat_light')),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Pick Up : ${widget.timings}',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Montserrat_Medium'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 200.0,
                    width: 150.0,
                    child: Image.asset('images/delivery.png'),
                  ),
                  Container(
                    height: 100.0,
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Estimated Delivery',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: '${widget.pickedService}' == 'Car DryClean'
                                  ? Text(
                                      '3 hours',
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      '48-72 hrs',
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                            )
                          ],
                        )),
                    decoration: BoxDecoration(
                        color: Color(0xFFF18287),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: 120,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  color: Colors.green,
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Antipasto_regular',
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    setState(() {
                      showSpinner = true;
                      _fireStore.collection('schedules').add({
                        'username': '${UserInfo['username']}',
                        'address': '${UserInfo['address']}',
                        'phone': '${UserInfo['phone']}',
                        'timings': '${widget.timings}',
                        'service': '${widget.pickedService}',
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThankYouPage()),
                      );
                    });
                  },
                ),
              ),
            ),
          ]),
        ));
  }
}

class GetInfo {
  getUserInfo(String email) {
    return Firestore.instance
        .collection('UserInfo')
        .where('email', isEqualTo: email)
        .getDocuments();
  }
}
