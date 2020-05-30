import 'package:flutter/material.dart';
import '../resources/UserRepository.dart';

class SideDrawerWidget extends StatefulWidget{
  @override
  State<SideDrawerWidget> createState() {
    return SideDrawerWidgetState();
  }
}

class SideDrawerWidgetState extends State<SideDrawerWidget> {

  int _selectedDrawerIndex = 0;
  var userRepository = new UserRepository();
  var user;
  @override
  void initState() {
    // TODO: implement initState
    getUserData();
    super.initState();
  }

  getUserData() async {
    var userdata = await userRepository.fetchUserFromDB();
    setState((){
      user = userdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: new GestureDetector(
              onTap: (){
                 Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/EditProfileScreen');
              },
              child: Container(
                // width: MediaQuery.of(context).size.width * 0.85,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/sidebar-bg.png"),
                          fit: BoxFit.cover)
                      ),
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                // margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.085),
                                width: MediaQuery.of(context).size.width * 0.2,
                                height: MediaQuery.of(context).size.height * 0.1,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: new NetworkImage( 
                                            user != null 
                                              ? (user.profile_image != null ? "http://mltaxi.codeartweb.com/"+user.profile_image: "")
                                              : "http://mltaxi.codeartweb.com/media/profileimage/profile-pic.jpg"
                                        )
                                    )
                                )
                              ),
                              SizedBox(
                                height: 10
                              ),
                              Text(
                                user != null ? (user.first_name != null ? user.first_name: "") : "",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          
                          child: Container(
                            width: 1,
                            height: MediaQuery.of(context).size.height * 0.1,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          flex: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                // margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.085),
                                width: MediaQuery.of(context).size.width * 0.2,
                                height: MediaQuery.of(context).size.height * 0.1,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: new AssetImage( 
                                            "assets/images/car@3x.png"
                                        )
                                    )
                                )
                              ),
                              SizedBox(
                                height: 10
                              ),
                              Text(
                                "Car Name",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            )
          ),
          Expanded(
            flex: 3,
            child: ListView(children: [
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/BookingScreen');
                },
              ),
              ListTile(
                title: Text("Documents"),
                leading: Icon(Icons.account_balance_wallet),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/DocumentsScreen');
                },
              ),
              ListTile(
                title: Text("QR Code"),
                leading: Icon(Icons.code),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/QRCodeScreen');
                },
              ),
              ListTile(
                title: Text("About"),
                leading: Icon(Icons.info),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.pushNamed(context, '/NotificationScreen');
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Help"),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.pushNamed(context, '/InviteScreen');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/SettingsScreen');
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                onTap: () {
                  userRepository.logoutUser();
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/');
                },
              )
            ]),
          )
        ],
      ),
    );
  }
}