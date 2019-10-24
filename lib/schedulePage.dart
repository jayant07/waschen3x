import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'review_Order.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'getUserInfo.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'size_config.dart';

class SchedulePage extends StatefulWidget {
  static const String id = 'schedulePage';

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  String picked;
  DateTime selectedService;
  String confirmedTime;
  FirebaseUser loggedInUser;
  String email;
  final _auth = FirebaseAuth.instance;
  bool reviewFlag = false;
  var UserInfo;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
//    GetInfo().getUserInfo(loggedInUser.email).then((QuerySnapshot docs) {
//      if (docs.documents.isNotEmpty) {
//        reviewFlag = true;
//        UserInfo = docs.documents[0].data;
//      }
//    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF18287),
        title: Text('Schedule'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                height: SizeConfig.screenHeight * .25,
                child: Image.asset('images/schedule.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'Choose a pick up date and time',
                  style: TextStyle(
                      fontFamily: 'Antipasto_Bold',
                      fontSize: 20.0,
                      color: Colors.black26),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(120, 0, 120, 0),
              child: Container(
                height: SizeConfig.screenHeight * .05,
                width: SizeConfig.screenWidth * 5,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    color: Color(0xFFF18287),
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        print('confirm $date');
                        setState(() {
                          confirmedTime = '$date'.substring(0, 16);
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Text(
                      'Pick my date',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Antipasto_regular',
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Choose a service',
                  style: TextStyle(
                      color: Colors.black26,
                      fontFamily: 'Antipasto_Bold',
                      fontSize: 20.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RadioButtonGroup(
                activeColor: Color(0xFFF18287),
                labels: <String>[
                  "Steam Press",
                  'Clothes DryClean'
                      "Car DryClean",
                  "Shoes",
                  "Leather",
                  "Household"
                ],
                onSelected: (String selected) => setState(
                  () {
                    picked = selected;
                    print(picked);
                    if (picked == null) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: Text(
                                  'Please choose one of our services to proceed'),
                            );
                          });
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(120, 10, 120, 16),
              child: Container(
                height: 40,
                width: 120,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    color: Color(0xFF44D56B),
                    onPressed: () async {
                      (picked == null || confirmedTime == null)
                          ? Alert(
                              context: context,
                              type: AlertType.info,
                              title: "Hello there",
                              desc:
                                  "We need you to select both time and a service for us to serve you well",
                              buttons: [
                                DialogButton(
                                  radius: BorderRadius.circular(40.0),
                                  width: 120.0,
                                  height: 40.0,
                                  color: Color(0xFFF18287),
                                  child: Text(
                                    "Cool",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            ).show()
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConfirmOrder(
                                        pickedService: picked,
                                        timings: confirmedTime,
                                        email: loggedInUser.email,
                                      )),
                            );
                    },
                    child: Text(
                      'Proceed',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Antipasto_regular',
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
