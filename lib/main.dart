import 'package:flutter/material.dart';
import 'screens/RegistrationScreen.dart';
import 'screens/SplashScreen.dart'; // TODO: Add splash by native methods
import 'screens/LoginScreen.dart';
import 'screens/BookingScreen.dart';
import 'screens/DocumentsScreen.dart';
import 'screens/QRCodeScreen.dart';
import 'screens/HistoryScreen.dart';
import 'screens/TotalRideScreen.dart';
import 'screens/InviteScreen.dart';
import 'screens/SettingsScreen.dart';
import 'screens/EditProfileScreen.dart';
import 'screens/UploadImageScreen.dart';

void main() => runApp(new Myan_Lyca());

// Root Widget of Myan_Lyca Application
class Myan_Lyca extends StatelessWidget {
  
	@override
	Widget build(BuildContext context) {
// #D42934 red color code for app
// #db313c 
		// Fixing App Orientation.
		// SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

		return new MaterialApp(
			debugShowCheckedModeBanner: false,
			title: 'Myan Lyca Driver',
			theme: new ThemeData(
				primarySwatch: Colors.red,
        appBarTheme: AppBarTheme(
          color: Color.fromRGBO(212, 41, 52, 1),
        ),
				// hintColor: Colors.white,
				// inputDecorationTheme: new InputDecorationTheme(
				// labelStyle: new TextStyle(color: Colors.white),
				// border: OutlineInputBorder(
				// borderRadius: BorderRadius.circular(4.0)))
			),
			// home: new SplashScreen(),
			routes: <String, WidgetBuilder>{
				'/': (BuildContext context) => new SplashScreen(),
				'/RegistrationScreen': (BuildContext context) => new RegistrationScreen(),
				'/LoginScreen': (BuildContext context) => new LoginScreen(),
				'/BookingScreen': (BuildContext context) => new BookingScreen(),
				'/DocumentsScreen': (BuildContext context) => new DocumentsScreen(),
				'/QRCodeScreen': (BuildContext context) => new QRCodeScreen(),
				'/HistoryScreen': (BuildContext context) => new HistoryScreen(),
				'/TotalRideScreen': (BuildContext context) => new TotalRideScreen(),
				'/InviteScreen': (BuildContext context) => new InviteScreen(),
				'/SettingsScreen': (BuildContext context) => new SettingsScreen(),
				'/EditProfileScreen': (BuildContext context) => new EditProfileScreen(),
				'/UploadImageScreen': (BuildContext context) => new UploadImageScreen(),
			}
		);
	}
}