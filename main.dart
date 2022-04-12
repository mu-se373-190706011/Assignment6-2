import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:mobileprogramming/page1.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/page1': (BuildContext context) => page1(),
        '/LoginPage': (BuildContext context) => LoginPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  //DATA'LARIN ÇEKİLMESİ
  Future<List<dynamic>> login() async {
    final response = await http
        .post(Uri.parse("http://localhost:8080/login/indexlogin.php"), body: {
      "username": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(json.encode(response.body));

    Navigator.of(context).pushReplacementNamed('/page1');

    return login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BAŞLIK
        appBar: AppBar(
          title: Text("ASSİGNMENT 6__ Login"),
        ),
        body: Column(
          children: <Widget>[
            //USERNAME KUTUCUĞU
            TextField(
              controller: user,
              decoration: InputDecoration(
                  icon: Icon(Icons.mail_outline), hintText: "Kullanıcı Adı"),
            ),
            //PASSWORD KUTUCUĞU
            TextField(
              controller: pass,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.key),
                hintText: "Şifre",
              ),
            ),
            //GİRİŞ BUTONU YAPIMI
            RaisedButton(
              color: Colors.blueGrey,
              child: Text("GİRİŞ"),
              onPressed: () {
                login();
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
}
