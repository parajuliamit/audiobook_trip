import 'package:audiobook_trip/Data/Network.dart';
import 'package:audiobook_trip/Domain/Author.dart';
import 'package:audiobook_trip/Presentation/Screens/AuthorBooksScreen.dart';
import 'package:flutter/material.dart';
import 'bookcard.dart';

class PopularAuthor extends StatefulWidget {
  @override
  _PopularAuthorState createState() => _PopularAuthorState();
}

class _PopularAuthorState extends State<PopularAuthor> {
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AuthorBookScreen(
                            author: popularAuthor[index],
                          ))),
                  child: BookCard(
                    //imageLocation: "$imageLocation",
                    title:
                        '${popularAuthor[index].firstName} ${popularAuthor[index].lastName}',
                    name: '',
                  ),
                ),
              );
            },
          );
  }
}
