import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/pages/add_food.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_order/pages/menu.dart';
import 'package:food_order/pages/order.dart';
import 'package:food_order/pages/profile.dart';

class Home extends StatefulWidget{
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {

  /* Declaration */
  int selectedIndex = 0;
  final db = FirebaseFirestore.instance;
  String _deleteId;
  CollectionReference foods = FirebaseFirestore.instance.collection('foods');
  
  List<Widget> tabPages = [
    Menu(),
    Order(),
    Profile()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  /* Modal */
  Future<void> _deleteConfirmation() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure want to delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Delete'),
              textColor: Colors.red,
              onPressed: () {
                db.collection("foods").doc(_deleteId).delete();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  /* Modal */
  
  @override
  Widget build(BuildContext context) {
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
                if(snapshot.data.docs.isNotEmpty)
                  return new ListView(
                    // padding: EdgeInsets.only(bottom: 10.0),
                    children: snapshot.data.docs.map((DocumentSnapshot document) {
                      return ListTile(
                        leading: Icon(Icons.fastfood, size: 50, color: Colors.lightBlueAccent),
                        title: new Text(document.data()['name']),
                        subtitle: new Text('RM ' + document.data()['price']),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, size: 30, color: Colors.red), 
                          onPressed: (){
                            _deleteConfirmation();
                            _deleteId = document.id;
                          }
                        ),
                      );
                    }).toList(),
                  );
                else{
                  return Text('No food available!');
                }
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: Text('Menu'),
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
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }
}