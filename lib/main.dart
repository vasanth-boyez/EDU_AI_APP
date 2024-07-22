// user_login_page.dart
import 'package:flutter/material.dart';
import 'login.dart'; // Import the user_dashboard.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:LoginScreen(),
    );
  }
}

