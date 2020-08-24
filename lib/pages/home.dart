import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/pages/add_food.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget{
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Ordered',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    CollectionReference foods = FirebaseFirestore.instance.collection('foods');

    return Scaffold(
      appBar: AppBar(
        title: Text('Food Ordering System'),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddFood()));
          },),
        ]
        ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: foods.snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if(snapshot.connectionState == ConnectionState.done && snapshot.data == null){
                return Text('No food available!');
              }
              else{
                return new ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    return new ListTile(
                      title: new Text(document.data()['name']),
                      subtitle: new Text(document.data()['price']),
                    );
                  }).toList(),
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: Text('Home'),
            ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: Text('Ordered'),
            ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: Text('Profile'),
            ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}