import 'package:audiobook_trip/Presentation/Screens/GenreBookScreen.dart';
import 'package:flutter/material.dart';

import 'bookcard.dart';

//String imageLocation = "assets/images/download.jpg";

List<String> genre = [
  'Poetry',
  'Children\'s Fiction',
  'Children\'s Non-fiction',
  'Crime & Mystery Fiction',
  'Family Life',
  'Plays',
  'Romance'
];
//
//List<GenreList> genreList = [
//  GenreList(
//    name: "Poetry",
//    picture: "assets/images/download.jpg",
//    author: "Authorname1",
//  ),
//  GenreList(
//    name: "Children's Fiction",
//    picture: "assets/images/download.jpg",
//    author: "Authorname2",
//  ),
//  GenreList(
//    name: "Children's Non-fiction",
//    picture: "assets/images/download.jpg",
//    author: "Authorname3",
//  ),
//];

class Genre extends StatefulWidget {
  @override
  _GenreState createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: genre.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 14, 16, 12),
          child: InkWell(
            onTap:
                ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new GenreBookScreen())),

            child: BookCard(
              //imageLocation: imageLocation,
              title: "${genre[index]}",
              name: "",
            ),
          ),
        );
      },
    );
  }
}

//class GenreList {
//  final String name;
//  final String author;
//  final String picture;
//
//  GenreList(
//      {@required this.name, @required this.author, @required this.picture});
//}
