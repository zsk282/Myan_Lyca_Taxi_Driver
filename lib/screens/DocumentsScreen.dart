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
  var documentData = null;
  var uploadedDocs = null;
  var uploadedDocsTemp = null;

  var userServices = new UserApiService();
  var driverServices = new DriverApiService();
  var userRepository = new UserRepository();
  var totalDocs = null;

  @override
  initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    var userdata = await userRepository.fetchUserFromDB();
    totalDocs = await driverServices.getDocumentType(userdata.auth_key);
    uploadedDocsTemp =
        await driverServices.getUploadedDocuments(userdata.auth_key);

    var temp = {};

    print(totalDocs);
    print(uploadedDocsTemp);

    if (totalDocs != null && uploadedDocsTemp != null) {
      for (var i = 0; i < totalDocs.length; i++) {
        for (var j = 0; j < uploadedDocsTemp.length; j++) {
          if (uploadedDocsTemp[j]["type_id"] == totalDocs[i]["type_id"]) {
            if (uploadedDocsTemp[j]["status"] == 1) {
              temp[totalDocs[i]["type_id"]] = {
                "name": totalDocs[i]["doc_name"],
                "status": 1
              };
            } else {
              temp[totalDocs[i]["type_id"]] = {
                "name": totalDocs[i]["doc_name"],
                "status": 0
              };
            }
          } else {
            temp[totalDocs[i]["type_id"]] = {
              "name": totalDocs[i]["doc_name"],
              "status": 0
            };
          }
        }
      }
    } else {
      temp = null;
    }

    setState(() {
      user = userdata;
      documentData = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Documents"),
        ),
        body: new Column(
          children: <Widget>[SizedBox(height: 10), listWidgets()],
        ));
  }

  Widget listWidgets() {
    print(">>>>>>>>>>>>>>");
    print(documentData);
    if (documentData == null) {
      if (totalDocs == null || uploadedDocsTemp == null) {
        return Container(child: Center(child: Text("No record to show. ")));
      } else {
        return Container(child: Center(child: CircularProgressIndicator()));
      }
    }
    List<Widget> temp = [];
    documentData.forEach((key, value) {
      print(value);
      temp.add(
        Container(
            margin: EdgeInsets.only(left: 10),
            decoration: new BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              //                    <--- top side
              color: Colors.black,
              width: 1.0,
            ))),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(value["name"],
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.black)),
                  SizedBox(height: 10),
                  value["status"] == 1
                      ? Text("Available", style: TextStyle(color: Colors.green))
                      : Text("Missing", style: TextStyle(color: Colors.red)),
                  // Divider(color: Colors.black)
                ],
              ),
              trailing: value["status"] == 1
                  ? Icon(Icons.check_box, color: Colors.green)
                  : Icon(Icons.file_upload, color: Colors.red),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            )),
      );
    });

    return Flexible(child: ListView(children: temp));
  }
}
