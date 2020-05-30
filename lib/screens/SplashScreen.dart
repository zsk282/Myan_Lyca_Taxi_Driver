import 'package:flutter/material.dart';
import 'dart:async';
import '../resources/UserRepository.dart';

class SplashScreen extends StatefulWidget {
	@override
	SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
	
  UserRepository userRepository = new UserRepository();
  bool isLoggedIn = false;

	void navigationToLoginPage() {
    if(isLoggedIn){
   	  Navigator.pushReplacementNamed(context, '/BookingScreen');
    }else{
   	  Navigator.pushReplacementNamed(context, '/LoginScreen');
    }
  }
  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 2);

    var user = await userRepository.fetchUserFromDB();
  
    if(user != null){
      print('>>>>>>> USer found in DB <<<<<<<<<');
      print(user.email);
      isLoggedIn = true;
    }else{
      print('>>>>>>> USer NNNNOOOTTT found in DB <<<<<<<<<');
      isLoggedIn = false;
    }

    return new Timer(_duration, navigationToLoginPage);
  }

	@override
	void initState() {
		super.initState();
    
    startSplashScreenTimer();
	}

	@override
	Widget build(BuildContext context) {
		// To make this screen full screen.
		// It will hide status bar and notch.
		// SystemChrome.setEnabledSystemUIOverlays([]);

		return Container(
			child: new Image.asset('assets/images/Splash.png', fit: BoxFit.fill)
		);
	}

}