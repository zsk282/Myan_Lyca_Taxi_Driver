import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../resources/UserRepository.dart';

class UploadImageScreen extends StatefulWidget {
  @override
  UploadImageScreenState createState() => UploadImageScreenState();
}

class UploadImageScreenState extends State<UploadImageScreen> {
  @override
  initState() {
    getUserData();
    super.initState();
  }

  var userRepository = new UserRepository();
  var user;
  bool _showUploadConfirmation = false;

  File profileImg;
  // File imageFile;

  void _chooseImage() async {
    profileImg = await ImagePicker.pickImage(source: ImageSource.gallery);
    await userRepository.updateUserProfileImage(user.auth_key, profileImg.path);
    await getUserData();
  }

  getUserData() async {
    var userdata = await userRepository.fetchUserFromDB();
    setState(() {
      user = userdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Upload Image"),
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FutureBuilder(
                        builder: (context, data) {
                          if (data.hasData) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width,
                                decoration: new BoxDecoration(
                                    // shape: BoxShape.circle
                                    ),
                                child:
                                    Image.file(data.data, fit: BoxFit.cover));
                          }
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width,
                              decoration: new BoxDecoration(
                                  // shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: new NetworkImage(user != null
                                          ? (user.profile_image != null
                                              ? "http://3.128.103.238/" +
                                                  user.profile_image
                                              : "")
                                          : "http://3.128.103.238/media/profileimage/profile-pic.jpg"))));
                        },
                        // future: profileImg,
                      )
                    ],
                  ),
                  // container for space between two rows
                  Container(
                      padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.09,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Visibility(
                          visible: !_showUploadConfirmation,
                          child: RaisedButton(
                            color: Colors.red,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(5.0),
                            onPressed: _chooseImage,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Center(
                                child: Text(
                                  'Upload New Image',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.030),
                                ),
                              ),
                            ),
                          )),
                      Visibility(
                          visible: _showUploadConfirmation,
                          child: RaisedButton(
                            color: Colors.red,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(5.0),
                            onPressed: () async {
                              // var file = await profileImg;
                              // print(user.auth_key);
                              // await userRepository.updateUserProfileImage(user.auth_key, file);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Center(
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.030),
                                ),
                              ),
                            ),
                          )),
                      Visibility(
                          visible: _showUploadConfirmation,
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.10)),
                      Visibility(
                          visible: _showUploadConfirmation,
                          child: RaisedButton(
                            color: Colors.red,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(5.0),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushNamed(context, '/BookingScreen');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.030),
                                ),
                              ),
                            ),
                          ))
                    ],
                  )
                ],
              )),
        ));
  }
}
