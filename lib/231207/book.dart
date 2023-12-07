void controlInstance() {
  var dayList = [ for (var i = 1; i <= 5; i++) DateTime(2023, 12, i)];
  List<Book> bookList = [
    for (var i = 0; i < dayList.length; i++) Book(
        title: 'Book$i', publishDate: dayList[i], comment: 'comment$i')
  ];

  bookList.shuffle();
  bookList.sort();
  bookList.printAll();

  var now = DateTime.now();
  var book = Book(title: 'title', publishDate: now, comment: '0');
  var book1 = Book(title: 'title', publishDate: now, comment: '1');

  print(book == book1); // true

  Set<Book> bookSet = {book, book1};
  print(bookSet.length); // prints '1'

  var deepCopiedBook = book1.copyWith();
  print(deepCopiedBook == book1); // true
  print(identical(book1, deepCopiedBook)); // false
}

class Book implements Comparable<Book> {
  String title;
  DateTime publishDate = DateTime.now();
  String comment;

  Book({
    required this.title,
    required this.publishDate,
    required this.comment,
  });

  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment,
  }) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      comment: comment ?? this.comment,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || this.hashCode == other.hashCode;

  @override
  int get hashCode =>
      Object.hash(title.hashCode, publishDate);

  @override
  String toString() {
    return 'Book{title: $title, publishDate: $publishDate, comment: $comment}';
  }

  @override
  int compareTo(Book other) {
    return this.publishDate.compareTo(other.publishDate);
  }
}

extension PrintableBook on List<Book> {
  @override
  void printAll() {
    var comment = 'Information: \n';

    for (var bookInfo in this) {
      comment += '${bookInfo.toString()},\n';
    }

    print(comment);
  }
}