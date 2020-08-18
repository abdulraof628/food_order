import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddFood extends StatefulWidget{
  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: 
          AppBar(
            title: Text('Add New Item'),
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
                        decoration: InputDecoration(
                          labelText: 'Name'
                        ),
                        validator: (val){
                          if(val.isEmpty){
                            return 'Please enter name';
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Price'
                        ),
                        validator: (val){
                          if(val.isEmpty){
                            return 'Please enter price';
                          }
                          else{
                            return null;
                          }
                        },
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
        // body: Column(
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.all(16.0),
        //       child: new 
        //     ),
        //     Padding(
        //       padding: EdgeInsets.only(left: 16.0, right: 16.0),
        //       child: new TextFormField(
        //         decoration: InputDecoration(
        //           labelText: 'Price'
        //         ),
        //       )
        //     ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Padding(
        //             padding: EdgeInsets.only(top: 16.0, right: 16.0),
        //             child: FlatButton(
        //               color: Colors.blue, 
        //               child: Text('Save'),
        //               onPressed: (){
        //               },
        //             ),
        //           ),
        //           Padding(
        //             padding: EdgeInsets.only(top: 16.0),
        //             child: FlatButton(
        //               color: Colors.grey[200], 
        //               child: Text('Cancel'),
        //               onPressed: (){
        //                 Navigator.pop(context);
        //               },
        //             ),
        //           ),
        //         ],
        //       )
        //   ],
        // ),
      );
  }
}