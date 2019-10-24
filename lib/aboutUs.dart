import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF18287),
        title: Text(
          'About Us',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(50)),
            child: Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(30),
              child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('images/splash.png')),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text('Our Mission',
                style: TextStyle(
                  fontSize: 52,
                  fontFamily: 'Antipasto_Bold',
                  color: Color(0xFFF18287),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
                'Bringing efficiency, reliability and Comfort in your life. We at waschen strive to help people save them time from routine hustle bustles of taking care of their belongings ',
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Antipasto_Regular',
                  color: Color(0xFF747474),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text('Trust',
                style: TextStyle(
                  fontSize: 52,
                  fontFamily: 'Antipasto_Bold',
                  color: Color(0xFFF18287),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
                'The very core of our business lies on trust of people we serve. To serve people to the maximum of their ultimate satisfaction is our primary goal.',
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Antipasto_Regular',
                  color: Color(0xFF747474),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text('Efficiency',
                style: TextStyle(
                  fontSize: 52,
                  fontFamily: 'Antipasto_Bold',
                  color: Color(0xFFF18287),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
                'At Waschen its all about providing all of our services as efficiently as possible. Eventually helping our consumers experience an unmatched service. ',
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Antipasto_Regular',
                  color: Color(0xFF747474),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text('Contribution',
                style: TextStyle(
                  fontSize: 52,
                  fontFamily: 'Antipasto_Bold',
                  color: Color(0xFFF18287),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
                'Our planet is depleting everyday. Our country with ever-growing population has lost sight of what is like to live a life with quality lifestyle and quality environment as well. Keeping such things in our mind we have taken initiatives Planting trees and helping a lot of peopl with various daily life problems is how we want to contribute',
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Antipasto_Regular',
                  color: Color(0xFF747474),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text('Our Word',
                style: TextStyle(
                  fontSize: 52,
                  fontFamily: 'Antipasto_Bold',
                  color: Color(0xFFF18287),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text('BETTER LIFESTYLE, BETTER ENVIRONMENT, BETTER ',
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Antipasto_Regular',
                  color: Color(0xFF747474),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text('Find Us',
                style: TextStyle(
                  fontSize: 52,
                  fontFamily: 'Antipasto_Regular',
                  color: Color(0xFFF18287),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                  onTap: _launchURL,
                  child: Image.asset(('images/facebbok.png'))),
              SizedBox(
                width: 16.0,
              ),
              GestureDetector(
                  onTap: _launchInstaURL,
                  child: Image.asset(('images/instagram.png')))
            ],
          ),
        )
      ]),
    );
  }
}

_launchInstaURL() async {
  const url = 'https://www.instagram.com/waschen.in/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL() async {
  const url = 'https://www.facebook.com/waschen.services/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
