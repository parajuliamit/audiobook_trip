import 'package:audiobook_trip/Data/Network.dart';
import 'package:audiobook_trip/Domain/Book.dart';
import 'package:audiobook_trip/Presentation/Screens/ListScreen.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  final String language;
  LanguageScreen({this.language});
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<Book> languageBooks = [];

  void getLanguageBooks() async {
    List<Book> book = await Network.getBooksLanguage(language: widget.language);
    setState(() {
      languageBooks = book;
    });
  }

  @override
  void initState() {
    super.initState();
    getLanguageBooks();
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
          widget.language,
          style: kTitle,
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: languageBooks.length,
        itemBuilder: (context, index) {
          //()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail())),
          return ListScreen(
            bookID: '${languageBooks[index].id}',
            bookname: "${languageBooks[index].title}",
            authorname:
                "${languageBooks[index].author.firstName} ${languageBooks[index].author.lastName}",
            language: "${languageBooks[index].language}",
            issuedyear: " ${languageBooks[index].copyrightYear}",
          );
        },
      ),
    );
  }
}
