import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatelessWidget {
  const RoundedRectangleButton({this.onPressed, this.title, this.icon});

  final Function onPressed;
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 100.0,
      height: 40.0,
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: Color(0xFFF18287),
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            icon,
            SizedBox(width: 10.0),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'AntiPasto_Light',
                  fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
