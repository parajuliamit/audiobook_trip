import 'dart:html';

import 'package:flutter/material.dart';
import 'package:audiobook_trip/Presentation/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'AudioBook',
          style: kTitle,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
    );
  }
}
