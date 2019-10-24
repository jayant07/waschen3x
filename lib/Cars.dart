import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'practice.dart';
import 'package:waschen2x/Pricings.dart';
import 'carPricings.dart';

class Cars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF18287),
        title: Text(
          'CARS',
          style: TextStyle(fontFamily: 'Antipasto_Regular'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 35.0, top: 50.0),
            alignment: Alignment.bottomLeft,
            height: 155.0,
            color: Color(0xFFF18287).withOpacity(0.5),
            child: Column(
              children: <Widget>[
                Image.asset('images/cars.png'),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Cars',
                  style: TextStyle(
                      color: Color(0xFFF18287),
                      fontFamily: 'Antipasto_Bold',
                      fontSize: 20.0),
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'items',
                style: TextStyle(
                    fontFamily: 'Antpasto_Bold',
                    fontSize: 15.0,
                    color: Color(0xFFF18287)),
              ),
              Text(
                'Estimated Rates',
                style: TextStyle(
                    fontFamily: 'fonts/Antpasto_Bold',
                    fontSize: 15.0,
                    color: Color(0xFFF18287)),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }
}

Widget _buildContent() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: carPrices.length,
    itemBuilder: (BuildContext content, int index) {
      Pricings pricings = carPrices[index];
      return pricings;
    },
  );
}

List<Pricings> carPrices = [
  Pricings(
    items: 'Cars',
    price: '150.0',
  ),
  Pricings(
    items: 'Sedan',
    price: '123',
  ),
  Pricings(
    items: 'Sedan',
    price: '123',
  ),
  Pricings(
    items: 'Sedan',
    price: '123',
  ),
  Pricings(
    items: 'Sedan',
    price: '123',
  ),
  Pricings(
    items: 'Sedan',
    price: '123',
  ),
  Pricings(
    items: 'Sedan',
    price: '123',
  ),
  Pricings(
    items: 'Sedan',
    price: '123',
  ),
  Pricings(
    items: 'Sedan',
    price: '123',
  ),
  Pricings(
    items: 'Sedan',
    price: '123',
  ),
  Pricings(
    items: 'Sedan',
    price: '123',
  ),
  Pricings(
    items: 'Sedan',
    price: '123',
  ),
];
