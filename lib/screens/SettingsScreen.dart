import 'package:flutter/material.dart';
import '../widgets/SideDrawerWidget.dart';

class SettingsScreen extends StatefulWidget {
  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Settings'),
        ),
        drawer: SideDrawerWidget(),
        body: new Container()
      );
  }
}