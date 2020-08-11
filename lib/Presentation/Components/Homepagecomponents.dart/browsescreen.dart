import 'package:audiobook_trip/Domain/Book.dart';
import 'package:audiobook_trip/Presentation/Screens/ListScreen.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:flutter/material.dart';
import 'package:audiobook_trip/Data/Network.dart';
import 'Bottommenu.dart';

//List<BrowseList> browseList =[
//BrowseList(name: "Bookname1", picture: "assets", author: "Authorname1", year:"1999" ),
//BrowseList(name: "Bookname2", picture: "jhjhgkbk", author: "Authorname2", year:"1996"),
//BrowseList(name: "Bookname3", picture: "assets", author: "Authorname3", year:"1998"),
//
//];
//

class BrowseScreen extends StatefulWidget {
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  List<Book> allBooks = [];

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
                      //()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail())),
                      return ListScreen(
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
