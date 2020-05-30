import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/DriverApiService.dart';

import '../resources/UserRepository.dart';
import '../services/UserApiService.dart';
import '../services/DriverApiService.dart';


class DocumentsScreen extends StatefulWidget {
  @override
  DocumentsScreenState createState() => DocumentsScreenState();
}

  class DocumentsScreenState extends State<DocumentsScreen> {
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
    var userwd = await driverServices.getTotalRidesByAccessToken(userdata.auth_key);
    print(userwd);
    setState((){
      user = userdata;
      totalRideData = userwd;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Documents"),
      ),
      body:  new Column(
        children: <Widget>[
          SizedBox(height: 10),
          listWidgets()
        ],
      )
    );
  }
  
  Widget listWidgets(){
    // if(totalRideData == null){
    //   return Container(child: Center(child: CircularProgressIndicator()));
    // }
    List<Widget> temp = [];
    for(int i=0; i< 5; i++){
      temp.add(
        Container(
          decoration: new BoxDecoration(
            border: Border(
              bottom: BorderSide( //                    <--- top side
                color: Colors.black,
                width: 1.0,
              )
            )
          ),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Driving License",style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                SizedBox(height: 10),
                Text("AAAAAAAAAAA"),
                // Divider(color: Colors.black)
              ],
            ),
            trailing: Icon(Icons.check_box,color: Colors.green),
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          )
        ),
      );
    }

    return Flexible(
      child:ListView(
        children: temp
      )
    );
  }
}