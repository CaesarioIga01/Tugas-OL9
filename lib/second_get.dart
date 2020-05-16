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
        appBar: AppBar(
          title: Text("GET"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                controller: text1,
              ),
              Text((user != null) ? user.id + " | " + user.name : "Tanpa Data"),
              RaisedButton(
                onPressed: () {
                  User.connectToAPI(text1.text).then((value) {
                    user = value;
                    setState(() {});
                  });
                },
                child: Text("GET"),
              ),
              RaisedButton(
                child: Text("Back"),
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
