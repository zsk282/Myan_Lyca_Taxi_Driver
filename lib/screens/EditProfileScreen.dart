import 'package:flutter/material.dart';
import '../resources/UserRepository.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {

  final _formKey = GlobalKey<FormState>();
  var userRepository = new UserRepository();
  var user;
  Map updateData; 

  TextEditingController _fnController;
  TextEditingController _lnController;
  TextEditingController _phController;
  TextEditingController _emailController;
  // TextEditingController _passController;

  @override
  void initState() {
    super.initState();
    getUserData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: new AppBar(
          title: new Text('Edit Profile'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/sidebar-bg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container()
                  ),
                  Center(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/UploadImageScreen');
                        },
                        child: Container(
                        margin: EdgeInsets.only(top:MediaQuery.of(context).size.width * 0.15),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: new NetworkImage(
                                  "http://mltaxi.codeartweb.com/"+user.profile_image
                                )
                            )
                        )
                      )
                    )
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Center(
                  child: Builder(
                    builder: (BuildContext context){
                      return Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _fnController,
                              // initialValue: user.first_name,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                // icon: Icon(Icons.person,color: Colors.black54),
                                fillColor: Colors.white,
                                labelText: 'First Name',
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                  // fontSize: 30
                                ),
                                border: InputBorder.none,
                              )
                            ),
                            TextFormField(
                              controller: _lnController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                // icon: Icon(Icons.person,color: Colors.black54),
                                fillColor: Colors.white,
                                labelText: 'Last Name',
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                  // fontSize: 30
                                ),
                                border: InputBorder.none,
                              )
                            ),
                            TextFormField(
                              controller: _phController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                // icon: Icon(Icons.person,color: Colors.black54),
                                fillColor: Colors.white,
                                labelText: 'Phone Number',
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                  // fontSize: 30
                                ),
                                border: InputBorder.none,
                              )
                            ),
                            TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                // icon: Icon(Icons.person,color: Colors.black54),
                                fillColor: Colors.white,
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                  // fontSize: 30
                                ),
                                border: InputBorder.none,
                              )
                            ),
                            RaisedButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  updateData = {
                                    "Users":{
                                      "first_name" :  _fnController.text,
                                      "last_name" :  _lnController.text,
                                      "mobile" :  _phController.text,
                                      "email" :  _emailController.text,
                                    }
                                  };
                                  await updateUserData(updateData);

                                  Fluttertoast.showToast(
                                      msg: "Profile Updated Successfully",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                }
                              },
                              child: Text('Update Data'),
                            )
                          ]
                        )
                      );
                    },
                  )
                )
              )
            ],
          )
        )
      );
  }

  getUserData() async {
    var userdata = await userRepository.fetchUserFromDB();
    setState((){
      user = userdata;
      print(user.auth_key);
      _fnController = TextEditingController(text: user.first_name);
      _lnController = TextEditingController(text: user.last_name);
      _phController = TextEditingController(text: user.mobile);
      _emailController = TextEditingController(text: user.email);
    });
  }

  updateUserData(data) async {
    return await userRepository.updateUser(user.auth_key,updateData);
  }
}