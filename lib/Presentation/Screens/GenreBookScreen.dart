import 'package:audiobook_trip/Data/Network.dart';
import 'package:audiobook_trip/Domain/Book.dart';
import 'package:audiobook_trip/Presentation/Screens/ListScreen.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:flutter/material.dart';

class GenreBookScreen extends StatefulWidget {
  final String genre;
  GenreBookScreen({this.genre});

  @override
  _GenreBookScreenState createState() => _GenreBookScreenState();
}

class _GenreBookScreenState extends State<GenreBookScreen> {
  List<Book> genreBooks = [];

  void getGenreBooks() async {
    List<Book> book = await Network.getGenreBooks(genre: widget.genre);
    setState(() {
      genreBooks = book;
    });
  }

  @override
  void initState() {
    super.initState();
    getGenreBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.genre,
          style: kTitle,
        ),
        backgroundColor: Colors.white,
      ),
      body: genreBooks.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: genreBooks.length,
              itemBuilder: (context, index) {
                //()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail())),
                return ListScreen(
                  bookID: '${genreBooks[index].id}',
                  bookname: "${genreBooks[index].title}",
                  authorname:
                      "${genreBooks[index].author.firstName} ${genreBooks[index].author.lastName}",
                  language: "${genreBooks[index].language}",
                  issuedyear: " ${genreBooks[index].copyrightYear}",
                );
              },
            ),
    );
  }
}
