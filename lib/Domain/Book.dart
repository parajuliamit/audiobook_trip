import 'package:audiobook_trip/Domain/Author.dart';

class Book {
  String id;
  String title;
  String description;
  String language;
  String copyrightYear;
  String totalTime;
  String sections;
  Author author;

  Book({
    this.id,
    this.title,
    this.author,
    this.description,
    this.copyrightYear,
    this.language,
    this.sections,
    this.totalTime,
  });
}
