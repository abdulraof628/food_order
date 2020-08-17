import 'package:flutter/material.dart';
import 'package:food_order/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
      @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
