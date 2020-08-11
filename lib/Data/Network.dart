import 'package:audiobook_trip/Domain/Author.dart';
import 'package:audiobook_trip/Domain/Book.dart';
import 'package:audiobook_trip/Domain/Sections.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';

class Network {
  static const String _baseUrl = "https://librivox.org/api/feed/";
  static const String _format = "&format=json";

  static Future<List<Author>> getPopularAuthors() async {
    String url = _baseUrl + 'authors?limit=10' + _format;
    List<Author> popularAuthors = [];
    try{    
    http.Response response;
    response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic rawData = jsonDecode(response.body);
      for (int i = 0; i < 10; i++) {
        var data = rawData['authors'][i];
        Author author = Author(
            id: data['id'],
            firstName: data['first_name'],
            lastName: data['last_name'],
            dob: data['dob'],
            dod: data['dod']);
        popularAuthors.add(author);
      }
    }
    return popularAuthors;
  }

  catch(e){
      print(e);
      return popularAuthors ;
  }
  }

  static Future<List<Book>> getPopularBooks() async {
    String url = _baseUrl + 'audiobooks?limit=10' + _format;
    List<Book> popularBooks = [];
    try{
    http.Response response;
    response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic rawData = jsonDecode(response.body);
      for (int i = 0; i < 10; i++) {
        var data = rawData['books'][i];
        var authorData = data['authors'][0];
        Author author = Author(
            id: authorData['id'],
            firstName: authorData['first_name'],
            lastName: authorData['last_name'],
            dob: authorData['dob'],
            dod: authorData['dod']);
        Book book = Book(
            id: data['id'],
            title: data['title'],
            description: data['description'],
            language: data['language'],
            author: author,
            sections: data['num_sections'],
            copyrightYear: data['copyright_year']);

        popularBooks.add(book);
      }
    }

    return popularBooks;
  }
   catch(e){
      print(e);
      return popularBooks;
       }
    }

  static Future<List<Book>> getGenreBooks({String genre}) async {
    try{
    String url = _baseUrl + 'audiobooks/?genre=$genre' + _format;
    List<Book> genreBooks = [];
    http.Response response;
    response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic rawData = jsonDecode(response.body);
      for (var data in rawData['books']) {
//        var data = rawData['books'][i];
        var authorData = data['authors'][0];
        Author author = Author(
            id: authorData['id'],
            firstName: authorData['first_name'],
            lastName: authorData['last_name'],
            dob: authorData['dob'],
            dod: authorData['dod']);
        Book book = Book(
            id: data['id'],
            title: data['title'],
            description: data['description'],
            language: data['language'],
            author: author,
            sections: data['num_sections'],
            copyrightYear: data['copyright_year']);

        genreBooks.add(book);
      }
    }

    return genreBooks;
  }
   catch(e){
      print(e);
      return null;
       }
    }

  static Future<List<Book>> getAuthorBooks({Author author}) async {
    try{
    String authorLastName = author.lastName;
    String authorID = author.id;
    String url = _baseUrl + 'audiobooks/?author=$authorLastName' + _format;
    List<Book> authorBooks = [];
    http.Response response;
    response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic rawData = jsonDecode(response.body);
      for (var data in rawData['books']) {
        var authorData = data['authors'][0];
        if (authorData['id'] != authorID) {
          continue;
        }
        Author author = Author(
            id: authorData['id'],
            firstName: authorData['first_name'],
            lastName: authorData['last_name'],
            dob: authorData['dob'],
            dod: authorData['dod']);
        Book book = Book(
            id: data['id'],
            title: data['title'],
            description: data['description'],
            language: data['language'],
            author: author,
            sections: data['num_sections'],
            copyrightYear: data['copyright_year']);

        authorBooks.add(book);
      }
    }

    return authorBooks;
    } catch(e){
      print(e);
      return null;
    }
  }

  static Future<List<Book>> getAllBooks() async {
    try{
    String url = _baseUrl + 'audiobooks/?' + _format;
    List<Book> allBooks = [];
    http.Response response;
    response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic rawData = jsonDecode(response.body);
      for (var data in rawData['books']) {
        var authorData = data['authors'][0];
        Author author = Author(
            id: authorData['id'],
            firstName: authorData['first_name'],
            lastName: authorData['last_name'],
            dob: authorData['dob'],
            dod: authorData['dod']);
        Book book = Book(
            id: data['id'],
            title: data['title'],
            description: data['description'],
            language: data['language'],
            author: author,
            sections: data['num_sections'],
            copyrightYear: data['copyright_year']);

        allBooks.add(book);
      }
    }

    return allBooks;
  }
   catch(e){
      print(e);
      return null;
       }
    }

  static Future<List<Author>> getAllAuthors() async {
    try{
    String url = _baseUrl + 'authors?' + _format;
    List<Author> allAuthors = [];
    http.Response response;
    response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic rawData = jsonDecode(response.body);
      for (var data in rawData['authors']) {
        Author author = Author(
            id: data['id'],
            firstName: data['first_name'],
            lastName: data['last_name'],
            dob: data['dob'],
            dod: data['dod']);
        allAuthors.add(author);
        print('Name: ' + author.firstName + author.lastName);
      }
    }
    return allAuthors;
  }
   catch(e){
      print(e);
      return null;
       }
    }

  static Future<List<Book>> getSearchBooks({String title}) async {
    try{
    String url = _baseUrl + 'audiobooks/?title=$title' + _format;
    List<Book> searchBooks = [];
    http.Response response;
    response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic rawData = jsonDecode(response.body);
      for (var data in rawData['books']) {
        var authorData = data['authors'][0];
        Author author = Author(
            id: authorData['id'],
            firstName: authorData['first_name'],
            lastName: authorData['last_name'],
            dob: authorData['dob'],
            dod: authorData['dod']);
        Book book = Book(
            id: data['id'],
            title: data['title'],
            description: data['description'],
            language: data['language'],
            author: author,
            sections: data['num_sections'],
            copyrightYear: data['copyright_year']);

        searchBooks.add(book);
      }
    }

    return searchBooks;
  }
   catch(e){
      print(e);
      return null;
       }
    }

  static Future<List<Author>> getSearchAuthors({String lastName}) async {
    try{
    String url = _baseUrl + 'authors?last_name=$lastName' + _format;
    List<Author> searchAuthors = [];
    http.Response response;
    response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic rawData = jsonDecode(response.body);
      for (var data in rawData['authors']) {
        Author author = Author(
            id: data['id'],
            firstName: data['first_name'],
            lastName: data['last_name'],
            dob: data['dob'],
            dod: data['dod']);
        searchAuthors.add(author);
      }
    }
    return searchAuthors;
  }
   catch(e){
      print(e);
      return null;
       }
    }

  static Future<List<Book>> getBooksLanguage({String language}) async {
    try{
    String url = _baseUrl + 'audiobooks/?' + _format;
    List<Book> languageBooks = [];
    http.Response response;
    response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic rawData = jsonDecode(response.body);
      for (var data in rawData['books']) {
        if (data['language'] != language) {
          continue;
        }
        var authorData = data['authors'][0];
        Author author = Author(
            id: authorData['id'],
            firstName: authorData['first_name'],
            lastName: authorData['last_name'],
            dob: authorData['dob'],
            dod: authorData['dod']);
        Book book = Book(
            id: data['id'],
            title: data['title'],
            description: data['description'],
            language: data['language'],
            author: author,
            sections: data['num_sections'],
            copyrightYear: data['copyright_year']);

        languageBooks.add(book);
      }
    }

    return languageBooks;
  }
   catch(e){
      print(e);
      return null;
       }
    }

  static Future<Book> getBookDetails({String id}) async {
    String url = _baseUrl + 'audiobooks/?id=$id' + _format;
    Book book;
    http.Response response;
    response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic rawData = jsonDecode(response.body);
      dynamic data = rawData['books'][0];
      var authorData = data['authors'][0];
      Author author = Author(
          id: authorData['id'],
          firstName: authorData['first_name'],
          lastName: authorData['last_name'],
          dob: authorData['dob'],
          dod: authorData['dod']);
      book = Book(
          id: data['id'],
          title: data['title'],
          description: data['description'],
          language: data['language'],
          author: author,
          sections: data['num_sections'],
          copyrightYear: data['copyright_year']);
    }
    return book;
  }

  static Future<List<Sections>> getSections({String id}) async {
    String url = 'https://librivox.org/rss/' + id;
    List<Sections> sections = [];
    http.Response response;
    final Xml2Json xml2Json = Xml2Json();
    try {
     response = await http.get(url);
      xml2Json.parse(response.body);

      var jsonParker = xml2Json.toParker();
      var jsonGdata = xml2Json.toGData();
      var data = jsonDecode(jsonParker);
      var link = jsonDecode(jsonGdata);
      var items = data['rss']['channel']['item'];
      var itemsLink = link['rss']['channel']['item'];
      int count = 0;
      for (var item in items) {
        Sections section = Sections(
            title: item['title'],
            duration: item['itunes:duration'],
            link: itemsLink[count]['enclosure']['url']);
        sections.add(section);
        count++;
      }
      return sections;
    } catch (e) {
      print(e);
      return sections;
    }
  }
}

