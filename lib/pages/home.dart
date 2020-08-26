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
        backgroundColor: Colors.deepPurple[300],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddFood()));
          },),
        ]
        ),
      body: Center(
        child: Container(
          // padding: const EdgeInsets.all(10.0),
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
                  // padding: EdgeInsets.only(bottom: 10.0),
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    return ListTile(
                        leading: Icon(Icons.fastfood, size: 50, color: Colors.amber),
                        title: new Text(document.data()['name']),
                        subtitle: new Text('RM ' + document.data()['price']),
                        onTap: (){},
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
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}