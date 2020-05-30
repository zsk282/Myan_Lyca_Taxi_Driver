import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xFFFF9000),
          title: new Text('Registartion'),
        ),
        body: new Container()
      );
  }
}