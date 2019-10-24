import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'practice.dart';

import 'package:waschen2x/Pricings.dart';

class Household extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF18287),
        title: Text(
          'HOUSEHOLD',
          style: TextStyle(fontFamily: 'Antipasto_Regular'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 40.0, top: 40.0),
            alignment: Alignment.bottomLeft,
            height: 155.0,
            color: Color(0xFFF18287).withOpacity(0.5),
            child: Column(
              children: <Widget>[
                Image.asset('images/home.png'),
                Text(
                  'Household',
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
          Expanded(
            child: _buildContent(),
          )
        ],
      ),
    );
  }
}

Widget _buildContent() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: houseHoldPrices.length,
    itemBuilder: (BuildContext content, int index) {
      Pricings pricings = houseHoldPrices[index];
      return pricings;
    },
  );
}

List<Pricings> houseHoldPrices = [
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
