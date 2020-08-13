import 'package:audiobook_trip/Data/Network.dart';
import 'package:audiobook_trip/Domain/Book.dart';
import 'package:flutter/material.dart';

import 'ListScreen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String input = '';

  List<Book> allBooks = [];

  void getBooks(String input) async {
    setState(() {
      allBooks = [];
    });
    List<Book> book = await Network.getSearchBooks(title: input);
    setState(() {
      allBooks = book;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 5.0), // for search box
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 1.0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    getBooks(input);
                  },
                ),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Explore your favourite books",
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    input = value;
                  },
                  onSubmitted: (value) {
                    getBooks(value);
                  },
                ),
                trailing: Icon(
                  Icons.filter_list,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: allBooks.length,
              itemBuilder: (context, index) {
                //()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail())),
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
        ],
      ),
    )));
  }
}
