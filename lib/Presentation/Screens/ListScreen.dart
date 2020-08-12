import 'package:audiobook_trip/Presentation/Screens/BookDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final String bookID;
  final String bookname;
  final String authorname;
  final String language;
  final String issuedyear;

  ListScreen(
      {@required this.bookname,
      @required this.authorname,
      @required this.language,
      @required this.issuedyear,
      @required this.bookID});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BookDetails(
            bookID: bookID,
            bookTitle: bookname,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blueGrey[50],
          height: 120.0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(bookname,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400)),
                  ),
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
                          style: TextStyle(fontSize: 12.0, color: Colors.grey)),
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
      ),
    );
  }
}
