import 'package:audiobook_trip/Data/Network.dart';
import 'package:audiobook_trip/Domain/Author.dart';
import 'package:audiobook_trip/Domain/Book.dart';
import 'package:audiobook_trip/Domain/Sections.dart';
import 'package:audiobook_trip/Presentation/Screens/AudioPlayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_html/flutter_html.dart';

class BookDetails extends StatefulWidget {
  final String bookTitle;
  final String bookID;

  BookDetails({@required this.bookID, this.bookTitle});

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  Book book = Book(
      id: '',
      language: '',
      title: '',
      copyrightYear: '',
      totalTime: '',
      sections: '',
      description: '',
      author: Author(firstName: '', lastName: '', dob: '', dod: ''));
  List<Sections> sections = [];

  void getBookDetails() async {
    Book newBook = await Network.getBookDetails(id: widget.bookID);
    List<Sections> newSections = await Network.getSections(id: widget.bookID);
    setState(() {
      book = newBook;
      sections = newSections;
    });
  }

  @override
  void initState() {
    super.initState();
    getBookDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text(
          'Book Details',
          style: kTitle,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                widget.bookTitle,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${book.author.firstName} ${book.author.lastName} (${book.author.dob} - ${book.author.dod})',
                style: TextStyle(color: Colors.blueGrey, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(1, 2), blurRadius: 2)
                ]),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Language: ${book.language}',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Html(
                        data: book.description,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Copyright Year: ${book.copyrightYear}',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      Text(
                        'Total Time: ${book.totalTime}',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      Text(
                        'Sections: ${book.sections}',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Sections',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: sections.length,
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blueGrey.withOpacity(0.6),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(1, 2)),
                            ],
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(5),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AudioPlayer(
                                link: sections[index]
                                    .link
                                    .replaceFirst(RegExp(r'http'), 'https'),
                                title: sections[index].title,
                              );
                            }));
                          },
                          title: Text(sections[index].title),
                          trailing: Text(sections[index].duration),
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
