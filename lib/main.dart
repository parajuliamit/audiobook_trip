import 'package:audiobook_trip/Domain/Author.dart';
import 'package:flutter/material.dart';
import 'package:audiobook_trip/Presentation/Screens/HomePage.dart';
import 'package:audiobook_trip/Data/Network.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Network.getAuthorBooks(author: Author(id: '806', lastName: 'Hope'));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AudioBook',
      home: HomePage(),
    );
  }
}
