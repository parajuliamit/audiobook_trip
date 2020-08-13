import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String imageLocation;
  final String title;
  final String name;
  BookCard({this.imageLocation, this.name, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.0,
      width: 190.0,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(15.0, 5.0),
          blurRadius: 4.0,
        ),
      ]),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                // Image.asset(imageLocation,  height: 240.0, width: 200.0, fit: BoxFit.cover,),

                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("$title",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "$name",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  height: 190.0,
                  width: 190.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.teal,
                        Colors.blueGrey,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
