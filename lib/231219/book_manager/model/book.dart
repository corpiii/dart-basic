class Book {
  int _id;
  String _title;
  DateTime _publishDate;
  bool isBorrowed;

  Book({
    this.isBorrowed = false,
    required int id,
    required String title,
    required DateTime publishDate,
  })  : _id = id,
        _title = title,
        _publishDate = publishDate;

  @override
  String toString() {
    return 'Book{_title: $_title, _publishDate: $_publishDate}';
  }
}