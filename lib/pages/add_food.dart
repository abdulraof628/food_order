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
  final _addFood = GlobalKey<FormState>();
  
  void addFood() async{
    await db.collection('foods').add({'name': _name.text, 'price': _price.text});
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: 
          AppBar(
            title: Text('Add New Item'),
            backgroundColor: Colors.deepPurple[300],
          ),
        body: Center(
          child: Form(
            key: _addFood,
            child: ListView(
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
                        validator: (value) =>
                          value.isEmpty ? 'Please enter food name' : null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
                      child: TextFormField(
                        controller: _price,
                        decoration: InputDecoration(
                          labelText: 'Price'
                        ),
                        validator: (value) =>
                          value.isEmpty ? 'Please enter price' : null,
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
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        child: Text('Save'),
                        onPressed: (){
                          if(_addFood.currentState.validate()){
                            addFood();
                            Navigator.pop(context);
                          }
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
          )
        )
      );
  }
}