import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/services.dart';
import '../resources/UserRepository.dart';

class QRCodeScreen extends StatefulWidget {
  @override
  QRCodeScreenState createState() => QRCodeScreenState();
}

class QRCodeScreenState extends State<QRCodeScreen> {
  Uint8List bytes = Uint8List(0);
  TextEditingController _inputController;
  TextEditingController _outputController;
  var userRepository = new UserRepository();
  var user;

  @override
  initState() {
    super.initState();
    this._inputController = new TextEditingController();
    this._outputController = new TextEditingController();

    getUserData();
    super.initState();
  }

  getUserData() async {
    var userdata = await userRepository.fetchUserFromDB();
    print(userdata.auth_key);
    setState(() {
      user = userdata;
    });
  }

  String result = "";
  Future _scanQR() async {
    try {
      String cameraScanResult = await scanner.scan();
      setState(() {
        result = cameraScanResult;
        // setting string result with cameraScanResult
        // data will come here so write code here
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scan Myan Code"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Center(
                  child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          bottom: MediaQuery.of(context).size.height * 0.05),
                      width: MediaQuery.of(context).size.height * 0.25,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: new NetworkImage(user != null
                                  ? (user != null
                                      ? "http://mltaxi.codeartweb.com/" +
                                          user.profile_image
                                      : "")
                                  : "http://mltaxi.codeartweb.com/media/profileimage/profile-pic.jpg"))))),
              Center(
                child: Text(user != null ? user.full_name : '',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        color: Colors.black)),
              ),
              // Center(
              //   child: Text('201 Successful Trips',
              //       style: TextStyle(
              //           fontSize: MediaQuery.of(context).size.height * 0.02,
              //           color: Colors.green)),
              // ),
              // Center(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: <Widget>[
              //       Icon(Icons.star, color: Colors.red),
              //       Icon(Icons.star, color: Colors.red),
              //       Icon(Icons.star, color: Colors.red),
              //       Icon(Icons.star, color: Colors.red)
              //     ],
              //   ),
              // ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Center(
                  child: user.qr_code != null
                      ? Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.05),
                          width: MediaQuery.of(context).size.height * 0.30,
                          height: MediaQuery.of(context).size.height * 0.30,
                          decoration: new BoxDecoration(
                              // shape: BoxShape.circle,
                              border: Border.all(color: Colors.black),
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: user != null
                                      ? new NetworkImage(
                                          "http://mltaxi.codeartweb.com/" +
                                              user.qr_code)
                                      : "")),
                          // child: user != null ? new NetworkImage(
                          // "http://mltaxi.codeartweb.com/"+ user.qr_code
                          // ) : CircularProgressIndicator(),
                        )
                      : Container())
              // RaisedButton(
              //   color: Colors.red,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.all(5.0),
              //   onPressed: (){
              //     _scanQR();
              //   },
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.70,
              //     child: Center(
              //       child: Text(
              //         'Scan QR Code Again',
              //         style: TextStyle(
              //           fontSize: MediaQuery.of(context).size.width * 0.030
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              // RaisedButton(
              //   color: Colors.red,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.all(5.0),
              //   onPressed: (){
              //     print('clicked on continue btn');
              //   },
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.70,
              //     child: Center(
              //       child: Text(
              //         'Book This Driver',
              //         style: TextStyle(
              //           fontSize: MediaQuery.of(context).size.width * 0.030
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // RaisedButton(
              //   color: Colors.red,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.all(5.0),
              //   onPressed: (){
              //     print('clicked on continue btn');
              //   },
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.70,
              //     child: Center(
              //       child: Text(
              //         'Pay Driver',
              //         style: TextStyle(
              //           fontSize: MediaQuery.of(context).size.width * 0.030
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // RaisedButton(
              //   color: Colors.red,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.all(5.0),
              //   onPressed: (){
              //     print('clicked on continue btn');
              //   },
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.70,
              //     child: Center(
              //       child: Text(
              //         'Start Trip',
              //         style: TextStyle(
              //           fontSize: MediaQuery.of(context).size.width * 0.030
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ), // Here the scanned result will be shown
        )
        // ,
        // floatingActionButton: FloatingActionButton.extended(
        //     icon: Icon(Icons.camera_alt),
        //     onPressed: () {
        //       _scanQR(); // calling a function when user click on button
        //     },
        //     label: Text("Scan Again")),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
  }
}
