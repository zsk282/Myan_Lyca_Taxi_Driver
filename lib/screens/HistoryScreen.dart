import 'package:flutter/material.dart';
import '../widgets/SideDrawerWidget.dart';

class HistoryScreen extends StatefulWidget {
  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Trip History'),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            // headWidget(),
            // paymentAndcoupons(),
            listWidgets()
          ],
        )
      ),
    );
  }

  Widget listWidgets(){
    return Flexible(
      child:ListView(
        children: <Widget>[
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
          Card(
            child: GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aug, 23 2019, 6:44 P.M.',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black)),
                        Text('Hyundai Eon',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.015,color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('RS 25',style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: Colors.black)),
                        Text('Expired',style: TextStyle(fontSize:  MediaQuery.of(context).size.height * 0.02,color: Colors.red)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    ),
                    child: Image.asset("assets/images/sample-map-poly.png"),
                  )
                ],
              )
            )
          ),
        ]
      )
    );
  }
}