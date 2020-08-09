import 'package:audiobook_trip/Domain/Author.dart';
import 'package:audiobook_trip/Domain/Book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  static const String _baseUrl = "https://librivox.org/api/feed/";
  static const String _format = "&format=json";

  static Future<List<Author>> getPopularAuthors() async {
    String url = _baseUrl + 'authors?' + _format;
    List<Author> popularAuthors = [];
    http.Response response;
    response = await http.get(url).timeout(Duration(seconds: 3), onTimeout: () {
      print('TimeOut');
      return http.get(url);
    });
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
//        print('Name: ' + author.firstName + author.lastName);
      }
    }
    return popularAuthors;
  }

  static Future<List<Book>> getPopularBooks() async {
    String url = _baseUrl + 'audiobooks?' + _format;
    List<Book> popularBooks = [];
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

  static Future<List<Book>> getGenreBooks({String genre}) async {
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

  static Future<List<Book>> getAuthorBooks({Author author}) async {
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
        print(book.author.firstName + book.id);
      }
    }

    return authorBooks;
  }

  static Future<List<Book>> getAllBooks() async {
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

  static Future<List<Author>> getAllAuthors() async {
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

  static Future<List<Book>> getSearchBooks({String title}) async {
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

  static Future<List<Author>> getSearchAuthors({String lastName}) async {
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
        print('Name: ' + author.firstName + author.lastName);
      }
    }
    return searchAuthors;
  }

  static Future<List<Book>> getBooksLanguage({String language}) async {
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
}
