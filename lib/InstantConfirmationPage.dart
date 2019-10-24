import 'package:flutter/material.dart';
import 'package:swipe_button/swipe_button.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:waschen2x/ThankYouPage.dart';
import 'menuButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'newHome_screen.dart';
import 'update_info.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'size_config.dart';

class ConfirmationPage extends StatefulWidget {
  static const String id = 'confirmationPage';
  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  final _fireStore = Firestore.instance;
  String picked;
  String address;
  String username;
  String phone;
  String email;
  FirebaseUser loggedInUser;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF18287),
          title: Text('Confirmation Page'),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 16, 8, 0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight * .2,
                          child: Image.asset('images/instantPickupCircle.png')),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Text(
                    'Choose from our host of service',
                    style: TextStyle(
                        fontFamily: 'Antipasto_Regular', fontSize: 25.0),
                  ),
                ),
                RadioButtonGroup(
                  activeColor: Color(0xFFF18287),
                  labels: <String>[
                    "Steam Press",
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
                Padding(
                  padding: EdgeInsets.all(50.0),
                  child: MenuButton(
                    item: 'Confirm',
                    onPressed: () async {
                      if (picked == null) {
                        Alert(
                          context: context,
                          type: AlertType.info,
                          title: "Hello there",
                          desc:
                              "We need you to select a service for us to serve you well",
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
                        ).show();
                      } else
                        setState(() {
                          showSpinner = true;
                          _fireStore.collection('picked').add({
                            'services': picked,
                            'username': loggedInUser.email,
                          });
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ThankYouPage()),
                          );
                        });
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
