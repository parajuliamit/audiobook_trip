import 'package:audiobook_trip/Data/Network.dart';
import 'package:audiobook_trip/Domain/Book.dart';
import 'package:audiobook_trip/Presentation/Screens/ListScreen.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:flutter/material.dart';

//List<GenreBookList> genreBookList = [
//  GenreBookList(
//      name: "Bookname1", picture: "assets", author: "Authorname", year: "1999"),
//  GenreBookList(
//      name: "Bookname2",
//      picture: "jhjhgkbk",
//      author: "Authorname2",
//      year: "1996"),
//  GenreBookList(
//      name: "Bookname3",
//      picture: "assets",
//      author: "Authorname3",
//      year: "1998"),
//];

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
