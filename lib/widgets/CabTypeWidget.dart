import 'dart:convert';

import 'package:flutter/material.dart';
import '../services/CabTypeService.dart';
import '../resources/UserRepository.dart';

class CabTypeWidget extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
   return CabTypeWidgetState();
  }
}

class CabTypeWidgetState extends State<CabTypeWidget> {

  String selectedOpt;
  bool _btnEnable = false;
  bool _isapiData = false;
  Map<String, bool> availCabData = {};
  var apiData;
  var userRepository = new UserRepository();
  var user;
  var cabTypeData;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return taxiSelectWidget();
  }
  getUserData() async {
    var userdata = await userRepository.fetchUserFromDB();
    setState((){
      user = userdata;
      // _getCabData();
    });
  }

  Future _getCabData() async {
    // var tempD = await CabTypeService().getAvailableCabs("d40a73297ca63e88b9c92045b361cdd0");
    // setState(() {
    //   cabTypeData = tempD;
    //   _isapiData = true;
    // });
  }

  Widget taxiSelectWidget(){
    return FutureBuilder(
      future:CabTypeService().getAvailableCabs("d40a73297ca63e88b9c92045b361cdd0"),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<Widget> loopedChild = [];
          if(snapshot.hasData){
            
            var temp = json.decode(snapshot.data.body);

            if (temp['success'].toString() == "true") {
              temp = temp['data'];
              for(var i= 0; i < temp.length; i++){
                availCabData[temp[i]['car_type']] = false;
                loopedChild.add(
                  availCab(
                    "assets/images/car@3x.png",
                    temp[i]['car_type'],
                    true
                  )
                );
              }
            }
          }
          return fixedLayout(loopedChild);
        }else{
          return fixedLayout(<Widget>[CircularProgressIndicator()]);
        }
      }
    );
  }

  Widget fixedLayout(List<Widget> loopedChild){
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.75,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: loopedChild
            ),
            RaisedButton(
              color: Colors.red,
              textColor: Colors.white,
              padding: EdgeInsets.all(5.0),
              onPressed: !_btnEnable ? null : (){
                print('clicked on continue btn');
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.70,
                child: Center(
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.030
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      )
    );
  }
  
  Widget availCab(String img, String title, bool isAvail){
    return GestureDetector(
      onTap: (){
        print("CABBB SELECTED $title");
        selectThisCab(title);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                  img,
                  width: MediaQuery.of(context).size.width * 0.15
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.030,
                    fontWeight: FontWeight.w900
                  ),
                ),
                Text(
                  isAvail ? "Avaiable" : "No Cabs",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.020,
                    // fontWeight: FontWeight.w900
                  ),
                )
              ]
            ),
            !availCabData[title] ? Container() : Positioned(
              bottom: 60.0,
              right: 1.0,
              child: Icon(Icons.check)
            )
          ],
        )
      )
    );
  }

  void selectThisCab(title){
    setState((){  
      availCabData[title] = true;
      availCabData.forEach( (k,v) { 
        if( k != title){
          availCabData[k] = false;
        }else{
          selectedOpt =  k;
          availCabData[k] = true;
        }
      } );
      _btnEnable = true;
    });
  }
}