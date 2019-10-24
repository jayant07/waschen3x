import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:flutter/material.dart';
import 'RoundButton.dart';
import 'wardrobe_page.dart';
import 'package:waschen2x/Cars.dart';
import 'householdPage.dart';
import 'style.dart';
import 'SignIn.dart';
import 'update_info.dart';
import 'Feedback.dart';
import 'enterOTP.dart';
import 'ServicesDialogBox.dart';
import 'roundedRectangleButton.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'sign_Up.dart';
import 'practice.dart';
import 'menuButton.dart';
import 'InstantConfirmationPage.dart';
import 'pictureSliderClass.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ThankYouPage.dart';
import 'schedulePage.dart';
import 'aboutUs.dart';
import 'package:waschen2x/Cars.dart';
import 'householdPage.dart';
import 'wardrobe_page.dart';
import 'editInfo.dart';
import 'shoes.dart';
import 'woolen.dart';
import 'steamPress.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:url_launcher/url_launcher.dart';
import 'auth.dart';
import 'size_config.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'newHome_screen';

  HomeScreen({this.auth, this.onSignedOut});

  final BaseAuth auth;
  final VoidCallback onSignedOut;

  void _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

//  void _profile() {
//    Navigator.pushNamed(context, SchedulePage());
//  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Image.asset('images/user.png'),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30.0),
              ListTile(
                leading: Icon(Icons.edit, color: Color(0xFFF18287)),
                title: Text(
                  'Update Info',
                  style: TextStyle(
                      fontFamily: 'Antipasto_Regular',
                      fontSize: 30.0,
                      color: Color(0xFFF18287)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditInfo(email: loggedInUser.email)),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.format_quote, color: Color(0xFFF18287)),
                title: Text(
                  'About Us',
                  style: TextStyle(
                      fontFamily: 'Antipasto_Regular',
                      fontSize: 30.0,
                      color: Color(0xFFF18287)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUs()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.chat_bubble, color: Color(0xFFF18287)),
                title: Text(
                  'Feedback',
                  style: TextStyle(
                      fontFamily: 'Antipasto_Regular',
                      fontSize: 30.0,
                      color: Color(0xFFF18287)),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FeedBack()));
                },
              ),
              ListTile(
                leading: Icon(Icons.star, color: Color(0xFFF18287)),
                title: Text(
                  'Rate our app',
                  style: TextStyle(
                      fontFamily: 'Antipasto_Regular',
                      fontSize: 30.0,
                      color: Color(0xFFF18287)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
              ),
              SizedBox(height: 20.0),
              Container(
                margin: EdgeInsets.all(17.0),
                child: Text(
                  'Follow us on Facebook and Instagram',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Antipasto_Regular',
                      color: Color(0xFFF18287)),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                margin: EdgeInsets.only(left: 16.0),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: _launchURL,
                        child: Image.asset('images/facebook.png')),
                    SizedBox(width: 10.0),
                    GestureDetector(
                        onTap: _launchInstaURL,
                        child: Image.asset('images/insta.png')),
                  ],
                ),
              ),
              SizedBox(height: 60.0),
              Container(
                margin: EdgeInsets.only(left: 16.0, right: 150.0),
                width: 100.0,
                height: 50.0,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0)),
                    textColor: Colors.white,
                    color: Color(0xFFF18287),
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                          fontSize: 20.0, fontFamily: 'Antipasto_regular'),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SignIn();
                          },
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFFF18287),
          title: Text(
            'Waschen',
            style: TextStyle(fontFamily: 'Antipasto_Bold', fontSize: 30),
          ),
        ),
        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: CarouselWithIndicator()),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SchedulePage.id);
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 10.0),
                      decoration: BoxDecoration(
                          color: Color(0xFFF18287),
                          borderRadius: BorderRadius.circular(5.0)),
                      height: 80.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(
                              Icons.timer,
                              color: Colors.white,
                              size: 45.0,
                            ),
                          ),
                          Text(
                            'Schedule a service',
                            style: TextStyle(
                                fontFamily: 'Antipasto_Bold',
                                color: Colors.white,
                                fontSize: 26.0),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * .2),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      width: SizeConfig.screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RoundedRectangleButton(
                              icon: Icon(Icons.calendar_view_day,
                                  color: Colors.white),
                              title: 'Wardrobe',
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // return alert dialog object
                                    return AlertDialog(
                                      title: Text(
                                        'Check pricings for our services',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFFF18287),
                                            fontFamily: 'Antipasto_Bold',
                                            fontSize: 25.0),
                                      ),
                                      content: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            MenuButton(
                                              item: 'Clothes',
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return WardrobePage();
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                            MenuButton(
                                              item: 'Cars',
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return Cars();
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                            MenuButton(
                                              item: 'Household',
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return Household();
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                            MenuButton(
                                              item: 'Steam Press',
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return SteamPress();
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                            MenuButton(
                                              item: 'Woolen & Leather',
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return Woolen();
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                            MenuButton(
                                              item: 'Shoes',
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return Shoes();
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                          SizedBox(width: 110),
                          FloatingActionButton(
                            child: Image.asset('images/flash.png'),
                            backgroundColor: Color(0xFF44D56B),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ConfirmationPage();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.facebook.com/waschen.services/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchInstaURL() async {
  const url = 'https://www.instagram.com/waschen.in/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
