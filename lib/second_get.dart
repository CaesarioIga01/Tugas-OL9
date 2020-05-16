import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ol9/user_model.dart';

class SecondGet extends StatefulWidget {
  @override
  _SecondGetState createState() => _SecondGetState();
}

class _SecondGetState extends State<SecondGet> {
  User user = null;
  final text1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.tealAccent,
        appBar: AppBar(
          leading: Icon(Icons.get_app),
          title: Text("GET"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                controller: text1,
              ),
              Text(
                (user != null) ? user.id + " | " + user.name : "Tanpa Data",
                style: TextStyle(
                    fontSize: 30, fontFeatures: [FontFeature.enable('smcp')]),
              ),
              RaisedButton(
                onPressed: () {
                  User.connectToAPI(text1.text).then((value) {
                    user = value;
                    setState(() {});
                  });
                },
                child: Text(
                  "GET",
                  style: TextStyle(
                      fontSize: 20, fontFamily: 'Lobster', color: Colors.teal),
                ),
              ),
              RaisedButton(
                child: Text(
                  "Back",
                  style: TextStyle(
                      fontSize: 20, fontFamily: 'Lobster', color: Colors.teal),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
