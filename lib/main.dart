import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttercrypto/home_page.dart';
import 'package:http/http.dart' as http;

void main() async {
  List currencies = await getCurrencies();
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  List _currencies;
  MyApp(this._currencies);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(_currencies),
    );
  }
}

Future<List> getCurrencies() async {
  final response = await http.get(
      "https://api.nomics.com/v1/prices?key=6e2db617fe3f1722460422fcff7140dc");
  final responseJson = jsonDecode(response.body);
  return responseJson;
}
