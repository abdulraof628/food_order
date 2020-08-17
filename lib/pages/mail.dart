import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Ordering System'),
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: Text('Home'),
            ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: Text('Mail'),
            ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: Text('Profile'),
            ),
        ],
      ),
    );
  }
}