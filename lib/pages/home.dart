import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/pages/add_food.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Ordering System'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddFood()));
          },),
        ]
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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