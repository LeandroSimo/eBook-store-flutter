import 'package:teste_escribo_app/src/models/book_model.dart';

class BookState {
  final List<BookModel> books;
  final bool isFavorite;

  BookState({
    required this.books,
    required this.isFavorite,
  });

  factory BookState.init() {
    return BookState(
      books: [],
      isFavorite: false,
    );
  }

  BookState copyWith({
    List<BookModel>? books,
    bool? isFavorite,
  }) {
    return BookState(
      books: books ?? this.books,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
