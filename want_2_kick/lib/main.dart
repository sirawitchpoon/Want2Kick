import 'package:flutter/material.dart';
import 'package:want_2_kick/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Want to Kick App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[850],
        fontFamily: 'SFProDisplay',
      ),
      home: HomePage(),
    );
  }
}
