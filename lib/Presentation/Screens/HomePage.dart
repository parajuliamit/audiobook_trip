import 'package:audiobook_trip/Presentation/Components/Homepagecomponents.dart/PopularAuthor.dart';
import 'package:audiobook_trip/Presentation/Components/Homepagecomponents.dart/Bottommenu.dart';
import 'package:audiobook_trip/Presentation/Components/Homepagecomponents.dart/Genre.dart';
import 'package:audiobook_trip/Presentation/Components/Homepagecomponents.dart/PopularBooks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audiobook_trip/Presentation/constants.dart';

import '../custom_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        title: Text(
          'AudioBook',
          style: kTitle,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "Popular Books"),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See All",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 240.0,
                    child: PopularBooks(),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "Genre"),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See All",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 240.0,
                    child: Genre(),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "Authors"),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See All",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 240.0,
                    child: PopularAuthor(),
                  ),
                ],
              ),
            ),
            BottomMenu(),
          ],
        ),
      ),
    );
  }
}
