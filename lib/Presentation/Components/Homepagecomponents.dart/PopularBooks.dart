import 'package:audiobook_trip/Domain/Book.dart';
import 'package:audiobook_trip/Presentation/Screens/BookDetails.dart';
import 'package:flutter/material.dart';
import 'bookcard.dart';
import 'package:audiobook_trip/Data/Network.dart';

class PopularBooks extends StatefulWidget {
  @override
  _PopularBooksState createState() => _PopularBooksState();
}

class _PopularBooksState extends State<PopularBooks> {
  //String imageLocation = 'assets/images/download.jpg';

  List<Book> popularBooks = [];

  void getBooks() async {
    List<Book> book = await Network.getPopularBooks();
    setState(() {
      popularBooks = book;
    });
  }

  @override
  void initState() {
     getBooks();
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return popularBooks.length == 0
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularBooks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(12, 14, 16, 12),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BookDetails(
                            bookID: popularBooks[index].id,
                            bookTitle: popularBooks[index].title,
                          ))),
                  child: BookCard(
                   // imageLocation: "$imageLocation",
                    title: popularBooks[index].title,
                    name:
                        '${popularBooks[index].author.firstName} ${popularBooks[index].author.lastName}',
                  ),
                ),
              );
            },
          );
  }
}
