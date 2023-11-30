import 'package:teste_escribo_app/src/models/book_model.dart';

class BookState {
  final List<BookModel> books;

  BookState({
    required this.books,
  });

  factory BookState.init() {
    return BookState(
      books: [],
    );
  }

  BookState copyWith({
    List<BookModel>? books,
  }) {
    return BookState(
      books: books ?? this.books,
    );
  }
}
