import 'package:audiobook_trip/Domain/Book.dart';
import 'package:audiobook_trip/Presentation/Screens/ListScreen.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:flutter/material.dart';
import 'package:audiobook_trip/Data/Network.dart';
import 'Bottommenu.dart';

List<Book> allBooks = [];

class BrowseScreen extends StatefulWidget {
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  void getBooks() async {
    List<Book> book = await Network.getAllBooks();
    setState(() {
      allBooks = book;
    });
  }

  @override
  void initState() {
    super.initState();
    getBooks();
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
          'All Books',
          style: kTitle,
        ),
        backgroundColor: Colors.white,
      ),
      body: allBooks.length == 0
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: allBooks.length,
                    itemBuilder: (context, index) {
                      return ListScreen(
                        bookID: "${allBooks[index].id}",
                        bookname: "${allBooks[index].title}",
                        authorname:
                            "${allBooks[index].author.firstName} ${allBooks[index].author.lastName}",
                        language: "${allBooks[index].language}",
                        issuedyear: " ${allBooks[index].copyrightYear}",
                      );
                    },
                  ),
                ),
                BottomMenu(),
              ],
            ),
    );
  }
}
