import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/pages/home.dart';

class AddFood extends StatefulWidget{
  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Item'),
        ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: new TextFormField(
              decoration: InputDecoration(
                labelText: 'Name'
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: new TextFormField(
              decoration: InputDecoration(
                labelText: 'Price'
              ),
            )
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.0, right: 16.0),
                  child: FlatButton(
                    color: Colors.blue, 
                    child: Text('Save'),
                    onPressed: (){
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: FlatButton(
                    color: Colors.grey[200], 
                    child: Text('Cancel'),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}