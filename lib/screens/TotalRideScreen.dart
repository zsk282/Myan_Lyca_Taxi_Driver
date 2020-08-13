import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/DriverApiService.dart';

import '../resources/UserRepository.dart';
import '../services/UserApiService.dart';
import '../services/DriverApiService.dart';

class TotalRideScreen extends StatefulWidget {
  @override
  TotalRideScreenState createState() => TotalRideScreenState();
}

class TotalRideScreenState extends State<TotalRideScreen> {
  var user;
  var totalRideData = null;

  var userServices = new UserApiService();
  var driverServices = new DriverApiService();
  var userRepository = new UserRepository();

  @override
  initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    var userdata = await userRepository.fetchUserFromDB();
    var userwd =
        await driverServices.getTotalRidesByAccessToken(userdata.auth_key);
    print(userwd);
    setState(() {
      user = userdata;
      totalRideData = userwd;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Previous Rides"),
        ),
        body: new Column(
          children: <Widget>[listWidgets()],
        ));
  }

  Widget listWidgets() {
    if (totalRideData == null) {
      return Container(child: Center(child: CircularProgressIndicator()));
    }
    List<Widget> temp = [];
    for (int i = 0; i < totalRideData.length; i++) {
      print(">>>>>><<<<<<<<<<<<");
      temp.add(ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.height * 0.04,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage("http://3.128.103.238/" +
                                totalRideData[i]['customer_image'])))),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Expanded(
                    flex: 1,
                    child: Text(
                        "K " +
                            (totalRideData[i]['amount'] != null
                                ? totalRideData[i]['amount']
                                : "0"),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            color: Colors.black))),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Expanded(
                  flex: 1,
                  child: Text(totalRideData[i]['date'],
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.015,
                          color: Colors.black)),
                ),
              ],
            ),
            Row(children: <Widget>[
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              Container(
                width: 1,
                height: MediaQuery.of(context).size.height * 0.02,
                color: Colors.black,
              )
            ]),
            Row(
              children: <Widget>[
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Container(
                    // margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.085),
                    width: MediaQuery.of(context).size.width * 0.02,
                    height: MediaQuery.of(context).size.height * 0.01,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new AssetImage(
                                "assets/images/pick-location.png")))),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Text(totalRideData[i]['source'])
              ],
            ),
            Row(children: <Widget>[
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              Container(
                width: 1,
                height: MediaQuery.of(context).size.height * 0.02,
                color: Colors.black,
              )
            ]),
            Row(
              children: <Widget>[
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Container(
                    // margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.085),
                    width: MediaQuery.of(context).size.width * 0.02,
                    height: MediaQuery.of(context).size.height * 0.01,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new AssetImage(
                                "assets/images/drop-location.png")))),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Text(totalRideData[i]['destination'])
              ],
            )
          ],
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      ));
    }

    return Flexible(child: ListView(children: temp));
  }
}
