class Book {
  String _title;
  DateTime _publishDate;
  bool isBorrowed;

  Book({
    this.isBorrowed = false,
    required String title,
    required DateTime publishDate,
  })  : _title = title,
        _publishDate = publishDate;
}