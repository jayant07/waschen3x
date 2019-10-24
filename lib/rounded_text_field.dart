import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField(
      {this.icon, this.hintText, this.onChanged, this.obscureText});
  final bool obscureText;
  final String hintText;
  final Icon icon;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      child: Column(
        children: <Widget>[
          Theme(
            data: ThemeData(
                splashColor: Color(0xFFF18287),
                primaryColor: Color(0xFFF18287)),
            child: TextField(
              obscureText: true,
              onChanged: onChanged,
              decoration: InputDecoration(
                prefixIcon: icon,
                hintText: hintText,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFF18287), width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFF18287), width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
