enum BorrowState {
  returned, borrowed, renewed;

  String get description {
    switch (this) {
      case BorrowState.returned:
        return '반납';
      case BorrowState.borrowed:
        return '대출';
      case BorrowState.renewed:
        return '연장';
    }
  }
}