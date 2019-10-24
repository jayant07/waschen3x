import 'package:flutter/material.dart';
import 'wardrobe_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'RoundedRectangleField.dart';
import 'RoundButton.dart';
import 'newHome_screen.dart';
import 'update_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'SignIn.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'auth.dart';

class SignUp extends StatefulWidget {
  SignUp({this.auth, this.onSignedIn});

  final BaseAuth auth;
  final VoidCallback onSignedIn;
  static const String id = 'sign_up';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool showSpinner = false;
  String _email;
  String _password;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(
                email: _email, password: _password))
            .user;
        if ((user != null)) {
          setState(() {
            showSpinner = true;
          });
          Navigator.pushNamed(context, UpdateInfo.id);
        }
        print(user.email);
        widget.onSignedIn;
      } catch (e) {
        print(e);
      }
    }
  }

  Future<FirebaseUser> _signIn(BuildContext context) async {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: Text('Signing in'),
    ));

    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser userDetails =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
      userDetails.providerId,
      userDetails.displayName,
      userDetails.photoUrl,
      userDetails.email,
      providerData,
    );
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Builder(
        builder: (context) => ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Center(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                      Widget>[
                SizedBox(
                  height: 108.0,
                ),
                Image.asset('images/logo.png'),
                SizedBox(
                  height: 100.0,
                ),
                Container(
                  width: 350.0,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) {
                            _email = value;
                          },
                          validator: (value) => value.isEmpty
                              ? 'Please enter an e-mail and password'
                              : null,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xFFF18287),
                            ),
                            hintText: 'e-mail',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFF18287), width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFF18287), width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          width: 350.0,
                          child: Theme(
                            data: ThemeData(
                                splashColor: Color(0xFFF18287),
                                primaryColor: Color(0xFFF18287)),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              obscureText: true,
                              onSaved: (value) {
                                _password = value;
                              },
//                            validator: (value) => value.isEmpty
//                                ? 'Please enter your e-mail and password'
//                                : null,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Color(0xFFF18287),
                                ),
                                hintText: 'password',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(32.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFF18287), width: 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(32.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFF18287), width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(32.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                ButtonTheme(
                  minWidth: 123.0,
                  height: 45.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    color: Color(0xFFF18287),
                    onPressed: validateAndSubmit,

//    async {
//                    setState(() {
//                      showSpinner = true;
//                    });
//                    try {
//                      final newUser =
//                          await _auth.createUserWithEmailAndPassword(
//                              email: email, password: password);
//                      if (newUser == newUser) {
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => UpdateInfo()));
//                      }
//                      setState(() {
//                        showSpinner = false;
//                      });
//                    } catch (e) {
//                      print(e);
//                    }
//                  },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontFamily: 'Antipasto_Regular',
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                  ),
                ),
                SizedBox(height: 60.0),
                Text(
                  'Already have an account?',
                  style: TextStyle(
                      fontFamily: 'Antipasto_Light', color: Colors.black),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 123.0,
                  height: 45.0,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      color: Color(0xFFF18287),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Antipasto_Regular',
                            fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      }),
                ),
                SizedBox(height: 60.0),
                MaterialButton(
                  child: Text(
                    'Google',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () => _signIn(context)
                      .then((FirebaseUser user) => print(user))
                      .catchError((e) => print(e)),
                )
              ]),
            )),
      ),
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails, this.userName, this.photoUrl,
      this.userEmail, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}
