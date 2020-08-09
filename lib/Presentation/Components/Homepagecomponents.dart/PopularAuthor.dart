import 'package:audiobook_trip/Data/Network.dart';
import 'package:audiobook_trip/Domain/Author.dart';
import 'package:flutter/material.dart';

import 'bookcard.dart';

//
//
//List<AuthorList> authorList =[
//AuthorList(name: "Author1", picture: "assets/images/download.jpg", author: "Authorname1", ),
//AuthorList(name: "Author2", picture: "assets/images/download.jpg", author: "Authorname2",),
//AuthorList(name: "Author3", picture: "assets/images/download.jpg", author: "Authorname3",),
//
//];

class PopularAuthor extends StatefulWidget {
  @override
  _PopularAuthorState createState() => _PopularAuthorState();
}

class _PopularAuthorState extends State<PopularAuthor> {
  String imageLocation = 'assets/images/download.jpg';

  List<Author> popularAuthor = [];

  void getAuthors() async {
    List<Author> author = await Network.getPopularAuthors();
    setState(() {
      popularAuthor = author;
    });
  }

  @override
  void initState() {
    super.initState();
    getAuthors();
  }

  @override
  Widget build(BuildContext context) {
    return popularAuthor.length == 0
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularAuthor.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(12, 14, 16, 12),
                child: InkWell(
                  onTap:
                      () {}, //()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail())),

                  child: BookCard(
                    imageLocation: "$imageLocation",
                    title: '',
                    name:
                        '${popularAuthor[index].firstName} ${popularAuthor[index].lastName}',
                  ),
                ),
              );
            },
          );
  }
}
