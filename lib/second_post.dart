import 'package:flutter/material.dart';
import 'package:ol9/post_result_model.dart';

class SecondPost extends StatefulWidget {
  @override
  _SecondPostState createState() => _SecondPostState();
}

class _SecondPostState extends State<SecondPost> {
  PostResult postResult = null;
  final api1 = TextEditingController();
  final api2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          leading: Icon(Icons.local_post_office),
          title: Text("POST"),
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                controller: api1,
              ),
              new TextField(
                controller: api2,
              ),
              RaisedButton(
                onPressed: () {
                  PostResult.connectToAPI(api1.text, api2.text).then((value) {
                    postResult = value;
                    setState(() {});
                  });
                },
                child: Text(
                  "POST",
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
