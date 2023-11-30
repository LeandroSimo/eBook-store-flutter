import 'package:teste_escribo_app/src/models/book_model.dart';

class BookState {
  final List<BookModel> books;
  final List<BookModel> booksFavorites;

  BookState({
    required this.books,
    required this.booksFavorites,
  });

  factory BookState.init() {
    return BookState(
      books: [],
      booksFavorites: [],
    );
  }

  BookState copyWith({
    List<BookModel>? books,
    List<BookModel>? booksFavorites,
  }) {
    return BookState(
      books: books ?? this.books,
      booksFavorites: booksFavorites ?? this.booksFavorites,
    );
  }
}
