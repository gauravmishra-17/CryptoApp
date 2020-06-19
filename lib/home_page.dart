import 'dart:convert';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  List currencies;
  HomePage(this.currencies);
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<MaterialColor> map = [Colors.blue, Colors.indigo, Colors.red];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto App"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Text("COIN"),
                  fit: FlexFit.tight,
                ),
                Flexible(
                  child: Text(
                    "PRICE",
                    style: TextStyle(
                      fontSize: 20,
                      backgroundColor: Color.fromRGBO(300, 20, 190, 20),
                    ),
                  ),
                  fit: FlexFit.tight,
                ),
              ],
            ),
          ),
          _cryptoWidget(),
        ],
      ),
    );
  }

  Widget _cryptoWidget() {
    return Flexible(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: widget.currencies.length,
              itemBuilder: (context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(widget.currencies[index]['currency']),
                        fit: FlexFit.tight,
                      ),
                      Flexible(
                        child: Text(widget.currencies[index]['price']),
                        fit: FlexFit.tight,
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
