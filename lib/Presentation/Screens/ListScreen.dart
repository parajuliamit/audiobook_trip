import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final String bookname;
  final String authorname;
  final String language;
  final String issuedyear;

  ListScreen(
      {@required this.bookname,
      @required this.authorname,
      @required this.language,
      @required this.issuedyear});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blueGrey[50],
          height: 120.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 0.0,
                right: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(bookname,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w400)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(authorname,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(language,
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey)),
                            Text(issuedyear,
                                style: TextStyle(
                                  fontSize: 12.0,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
