import 'package:flutter/material.dart';

class squareOTP extends StatelessWidget {
  const squareOTP({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      child: Theme(
        data: ThemeData(
            splashColor: Color(0xFFF18287), primaryColor: Color(0xFFF18287)),
        child: TextField(
          cursorColor: Color(0xFFF18287),
          keyboardType: TextInputType.number,
          maxLines: 1,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(0),
                ),
              ),
              filled: true,
              hintStyle: TextStyle(
                  color: Color(0xFFF18287),
                  fontFamily: 'Antipasto_Regular',
                  fontSize: 20.0),
              fillColor: Colors.white),
        ),
      ),
    );
  }
}
