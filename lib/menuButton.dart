import 'package:flutter/material.dart';
import 'size_config.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({this.onPressed, this.item});

  final Function onPressed;
  final String item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * .64,
      height: SizeConfig.screenHeight * .055,
      child: FlatButton(
        textColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        color: Color(0xFFF18287),
        onPressed: onPressed,
        child: Text(
          item,
          style: TextStyle(fontFamily: 'Antipasto_bold', fontSize: 20.0),
        ),
      ),
    );
  }
}
