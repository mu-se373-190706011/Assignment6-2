import 'package:flutter/material.dart';

class page1 extends StatelessWidget {
  const page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Profile"),
      ),
      body: Column(
        children: <Widget>[
          Title(
              color: Colors.black,
              child: Text(
                  "Id: 1 \n\nUsername : Helen \n\nEmail : helen@gmail.com \n\nGender : Female")),
          RaisedButton(
            child: Text("geri"),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "LoginPage");
            },
          )
        ],
      ),
    );
  }
