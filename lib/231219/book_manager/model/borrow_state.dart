enum BorrowState {
  returned, borrowed;

  String get description {
    switch (this) {
      case BorrowState.returned:
        return '반납';
      case BorrowState.borrowed:
        return '대출';
    }
  }
}