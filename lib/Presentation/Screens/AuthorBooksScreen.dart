import 'package:audiobook_trip/Data/Network.dart';
import 'package:audiobook_trip/Domain/Author.dart';
import 'package:audiobook_trip/Domain/Book.dart';
import 'package:audiobook_trip/Presentation/Screens/ListScreen.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:flutter/material.dart';

class AuthorBookScreen extends StatefulWidget {
  final Author author;

  AuthorBookScreen({this.author});

  @override
  _AuthorBookScreenState createState() => _AuthorBookScreenState();
}

class _AuthorBookScreenState extends State<AuthorBookScreen> {
  List<Book> authorBooks = [];

  void getAuthorBooks() async {
    List<Book> book = await Network.getAuthorBooks(author: widget.author);
    setState(() {
      authorBooks = book;
    });
  }

  @override
  void initState() {
    super.initState();
    getAuthorBooks();
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
          '${widget.author.firstName} ${widget.author.lastName}',
          style: kTitle,
        ),
        backgroundColor: Colors.white,
      ),
      body: authorBooks.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: authorBooks.length,
              itemBuilder: (context, index) {
                return ListScreen(
                  bookID: '${authorBooks[index].id}',
                  bookname: "${authorBooks[index].title}",
                  authorname: "",
                  language: "${authorBooks[index].language}",
                  issuedyear: " ${authorBooks[index].copyrightYear}",
                );
              },
            ),
    );
  }
}
