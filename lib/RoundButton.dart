import 'package:flutter/material.dart';
import 'wardrobe_page.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({this.text, this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 60.0,
      height: 60.0,
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        color: Color(0xFFF18287),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Antipasto_Light',
              color: Colors.white,
              fontSize: 40.0),
        ),
      ),
    );
  }
}
