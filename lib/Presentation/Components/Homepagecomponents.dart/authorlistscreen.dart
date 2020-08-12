import 'package:audiobook_trip/Data/Network.dart';
import 'package:audiobook_trip/Domain/Author.dart';
import 'package:audiobook_trip/Presentation/Screens/AuthorList.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:flutter/material.dart';

//
//
//List<AuthorList> authorList =[
//AuthorList(name: "Author1", ),
//AuthorList(name: "Author1", ),
//AuthorList(name: "Author1", ),
//AuthorList(name: "Author1", ),
//
//
//];

class AuthorListScreen extends StatefulWidget {
  @override
  _AuthorListScreenState createState() => _AuthorListScreenState();
}

class _AuthorListScreenState extends State<AuthorListScreen> {
  List<Author> allAuthors = [];

  void getAuthors() async {
    List<Author> author = await Network.getAllAuthors();
    setState(() {
      allAuthors = author;
    });
  }

  @override
  void initState() {
    super.initState();
    getAuthors();
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
          'Authors',
          style: kTitle,
        ),
        backgroundColor: Colors.white,
      ),
      body: allAuthors.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: allAuthors.length,
              itemBuilder: (context, index) {
                return Authors(
                  author: allAuthors[index],
                );
              },
            ),
    );
  }
}

//
//
//class AuthorList{
//
//final String name;
//
//
//
//AuthorList( {@required  this.name  });
//
//}
