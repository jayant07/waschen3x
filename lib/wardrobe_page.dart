import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'practice.dart';
import 'package:waschen2x/Pricings.dart';

class WardrobePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFF18287),
            title: Text(
              'Clothes',
              style: TextStyle(fontFamily: 'Antipasto_Regular'),
            ),
          ),
          body: Column(
            children: <Widget>[
              Container(
                height: 155.0,
                color: Color(0xFFF18287).withOpacity(0.5),
                child: TabBar(
                  indicatorColor: Color(0xFFF18287),
                  tabs: <Widget>[
                    Tab(
                      child: Image.asset(
                        'images/mens.png',
                      ),
                    ),
                    Tab(
                      child: Image.asset(
                        'images/womens.png',
                      ),
                    ),
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
                  child: TabBarView(
                children: <Widget>[_buildMensContent(), _buildWomensContent()],
              ))
            ],
          ),
        ));
  }
}

Widget _buildMensContent() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: mensPrices.length,
    itemBuilder: (BuildContext content, int index) {
      Pricings pricings = mensPrices[index];
      return pricings;
    },
  );
}

List<Pricings> mensPrices = [
  Pricings(
    items: 'mens',
    price: '150.0',
  ),
  Pricings(
    items: 'Sedan',
    price: '34.0',
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

Widget _buildWomensContent() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: womensPrices.length,
    itemBuilder: (BuildContext content, int index) {
      Pricings pricings = womensPrices[index];
      return pricings;
    },
  );
}

List<Pricings> womensPrices = [
  Pricings(
    items: 'Womens',
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
