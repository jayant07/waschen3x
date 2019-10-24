import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waschen2x/newHome_screen.dart';
import 'menuButton.dart';
import 'package:flip_card/flip_card.dart';
import 'size_config.dart';

class ThankYouPage extends StatefulWidget {
  @override
  _ThankYouPageState createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 44.0),
            child: Container(
              height: SizeConfig.screenHeight * .13,
              width: SizeConfig.screenWidth * .32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: FlipCard(
                direction: FlipDirection.HORIZONTAL,
                front: Container(
                    child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 50.0,
                )),
                back: Container(
                  child: Icon(
                    Icons.insert_emoticon,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Hello there, your order has been placed!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, fontFamily: 'Antipasto_Regular'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
                height: SizeConfig.screenHeight * .3,
                width: SizeConfig.screenWidth,
                child: Image.asset('images/relax.png')),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: SizeConfig.screenHeight * .099,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xFFD2F9FA),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Sit back and relax now. Our boys will be at your service soon.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Antipasto_Regular',
                        fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(35.0),
            child: MenuButton(
              item: 'H O M E',
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
