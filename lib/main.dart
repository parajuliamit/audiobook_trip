import 'package:flutter/material.dart';
import 'package:audiobook_trip/Presentation/Screens/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AudioBook',
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Color(0xFF64B5F6),
        fontFamily: 'GreatVibes'
      )
    );
  }
}
