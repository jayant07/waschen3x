import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField(
      {this.onPressed,
      this.keyboardType,
      this.icon,
      this.hintText,
      this.onChanged});

  final Function onPressed;
  final TextInputType keyboardType;
  final Icon icon;
  final String hintText;
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
            child: Center(
              child: TextField(
                onChanged: onChanged,
                cursorColor: Color(0xFFF18287),
                keyboardType: keyboardType,
                decoration: InputDecoration(
                    prefixIcon: icon,
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(50.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(
                        color: Color(0xFFF18287),
                        fontFamily: 'Antipasto_Regular',
                        fontSize: 20.0),
                    hintText: hintText,
                    fillColor: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
