import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  List imgList = [
    'images/OurWord.png',
    'images/ExclusiveDiscount.png',
    'images/FirstOrders.png',
    'images/AboutInstantPickUp.png',
    'images/CorporalPack.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        height: 200.0,
        autoPlay: true,
        reverse: false,
        aspectRatio: 16 / 9,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
        items: imgList.map((imgUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF18287),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Image.asset(imgUrl));
            },
          );
        }).toList(),
      ),
    ]);
  }
}
//Positioned(
//top: 0.0,
//left: 0.0,
//right: 0.0,
//child: Row(
//mainAxisAlignment: MainAxisAlignment.center,
//children: map<Widget>(imgList, (index, url) {
//return Container(
//width: 8.0,
//height: 8.0,
//margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
//decoration: BoxDecoration(
//shape: BoxShape.circle,
//color: _current == index
//? Color.fromRGBO(0, 0, 0, 0.9)
//    : Color.fromRGBO(0, 0, 0, 0.4)),
//);
//}),
//))
