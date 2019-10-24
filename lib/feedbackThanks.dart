import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'menuButton.dart';
import 'newHome_screen.dart';

class FeedbackThanks extends StatefulWidget {
  @override
  _FeedbackThanksState createState() => _FeedbackThanksState();
}

class _FeedbackThanksState extends State<FeedbackThanks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 44.0),
                child: Container(
                  height: 100.0,
                  width: 100.0,
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
                padding: EdgeInsets.all(16.0),
                child: Material(
                  elevation: 6.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Hey, we really appreciate for your time and feedback. You can expect a message from us soon if you are having trouble with our service. Thank you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.0, fontFamily: 'Antipasto_Regular'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                    height: 200,
                    width: 200,
                    child: Image.asset('images/thankyou.png')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xFFD2F9FA),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'If you happen to love our service we would really love it, if you can share this app to your neighbouring friends and families.',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
              )
            ]),
      ),
    );
  }
}
