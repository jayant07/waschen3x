import 'package:flutter/material.dart';
import 'wardrobe_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'RoundedRectangleField.dart';
import 'RoundButton.dart';
import 'main.dart';
import 'newHome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'auth.dart';

class SignIn extends StatefulWidget {
  SignIn({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  String _email;
  String _password;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
        FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
                email: _email, password: _password))
            .user;
        if ((user != null)) {
          setState(() {
            showSpinner = true;
          });
          Navigator.pushNamed(context, HomeScreen.id);
        }
        print(user.email);
        widget.onSignedIn;
      } catch (e) {
        print(e);
        setState(() {
          showSpinner = false;
          Fluttertoast.showToast(
              msg: "please enter right credentials",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Color(0xFFF18287),
              timeInSecForIos: 1);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF18287),
      ),
      resizeToAvoidBottomPadding: false,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(
                height: 30.0,
              ),

              SizedBox(
                height: 30.0,
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
                        onSaved: (String value) {
                          _email = value;
                        },
                        validator: (value) => value.isEmpty
                            ? 'Plese enter your e-mail and password'
                            : null,
//                            (!EmailValidator.validate(value, true) &&
//                                    value != "")
//                                ? 'Not a valid email'
//                                : null,
//                        autovalidate: true,
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
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          obscureText: true,
//                          autovalidate: true,
                          onSaved: (value) {
                            _password = value;
                          },
//                          validator: (value) => value.isEmpty
//                              ? 'please enter your password'
//                              : null,
//                          validator: (value) =>
//                              (value.length < 6 && value != "")
//                                  ? 'Password too short...'
//                                  : null,
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
                    ],
                  ),
                ),
              ),
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
                  onPressed: validateAndSubmit,

//                  onPressed: () async {
//                    setState(() {
//                      showSpinner = true;
//                    });
//                    try {
//                      final user = await _auth.signInWithEmailAndPassword(
//                          email: email, password: password);
//                      if (user != null) {
//                        Navigator.pushNamed(context, HomeScreen.id);
//
//                        setState(() {
//                          showSpinner = false;
//                        });
//                      } else {
//                        setState(() {
//                          showSpinner = false;
//                          Fluttertoast.showToast(
//                              msg: "please enter right credentials",
//                              toastLength: Toast.LENGTH_SHORT,
//                              gravity: ToastGravity.CENTER,
//                              timeInSecForIos: 1);
//                        });
//                      }
//                    } catch (e) {
//                      print(e);
//                    }
//                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        fontFamily: 'Antipasto_Regular',
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(height: 100.0),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  RoundButton(
//                    text: 'G',
//                  ),
//                  SizedBox(
//                    width: 70.0,
//                  ),
//                  RoundButton(text: 'f'),
//                ],
//              )
            ],
          ),
        ),
      ),
    );
  }
}
