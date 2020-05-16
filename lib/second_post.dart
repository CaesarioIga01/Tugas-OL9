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
        appBar: AppBar(
          title: Text("POST"),
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
                  PostResult.connectToAPI(api1.text, api2.text)
                      .then((value) {
                    postResult = value;
                    setState(() {});
                  });
                },
                child: Text("POST"),
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
