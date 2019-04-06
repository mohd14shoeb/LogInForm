import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Log me In!',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Log in"),
        ),
        body: LoginScreen(),
      ),
    );
  }
}