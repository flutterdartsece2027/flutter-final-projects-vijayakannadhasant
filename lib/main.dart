import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'firebase_options.dart';
import 'splash_screen.dart'; // Import the Splash Screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Auth',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(), // Start with the Splash Screen
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => RegistrationScreen(),
        '/home': (context) => homepage(),
      },
    );
  }
}
