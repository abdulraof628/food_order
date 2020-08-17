import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mail'),
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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