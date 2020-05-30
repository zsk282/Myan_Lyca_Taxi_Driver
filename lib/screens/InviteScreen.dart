import 'package:flutter/material.dart';
import '../widgets/SideDrawerWidget.dart';

class InviteScreen extends StatefulWidget {
  @override
  InviteScreenState createState() => InviteScreenState();
}

class InviteScreenState extends State<InviteScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Invite'),
        ),
        drawer: SideDrawerWidget(),
        body: new Container()
      );
  }
}