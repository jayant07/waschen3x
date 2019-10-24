import 'package:flutter/material.dart';

class Pricings extends StatelessWidget {
  const Pricings({this.items, this.price});

  final String items;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 180,
            padding: EdgeInsets.all((8)),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset('images/tags.png'),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        items,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: 'Antipasto_Regular',
                            fontSize: 25,
                            color: Color(0xFFF18287)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: 95.0),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset('images/rupee.png'),
                    SizedBox(width: 10),
                    Text(
                      price,
                      style: TextStyle(
                          fontFamily: 'Montserrat_Medium', fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
