import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFood extends StatefulWidget{
  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {

  final db = FirebaseFirestore.instance;

  TextEditingController _name = TextEditingController();
  TextEditingController _price = TextEditingController();
  
  void addFood() async{
    await db.collection('foods').add({'name': _name.text, 'price': _price.text});
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: 
          AppBar(
            title: Text('Add New Item'),
            backgroundColor: Colors.purple,
          ),
        body: 
          ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
                      child: TextFormField(
                        autofocus: true,
                        controller: _name,
                        decoration: InputDecoration(
                          labelText: 'Name'
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
                      child: TextFormField(
                        controller: _price,
                        decoration: InputDecoration(
                          labelText: 'Price'
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, right: 20),
                      child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text('Save'),
                        onPressed: (){
                          addFood();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        color: Colors.grey[200],
                        textColor: Colors.black,
                        child: Text('Cancel'),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ]
          )
      );
  }
}