import 'package:audiobook_trip/Presentation/Components/Homepagecomponents.dart/Bottommenu.dart';
import 'package:audiobook_trip/Presentation/Screens/languagelist.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:flutter/material.dart';

List<String> languages = [
  'English',
//  'French',
//  'Spanish',
//  'German',
//  'Italian',
//  'Arabic',
//  'Chinese',
//  'Dutch',
//  'Latin',
//  'Multilingual',
//  'Russian'
];

class LanguageListScreen extends StatefulWidget {
  @override
  _LanguageListScreenState createState() => _LanguageListScreenState();
}

class _LanguageListScreenState extends State<LanguageListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Languages',
          style: kTitle,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return Language(
                  language: "${languages[index]}",
                );
              },
            ),
          ),
          BottomMenu()
        ],
      ),
    );
  }
}
