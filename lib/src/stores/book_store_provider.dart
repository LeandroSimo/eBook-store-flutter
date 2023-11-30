import 'package:flutter/material.dart';
import 'package:teste_escribo_app/src/models/book_model.dart';
import 'package:teste_escribo_app/src/repositories/book_repository.dart';
import 'package:teste_escribo_app/src/states/book_state.dart';

class BookStoreProvider extends ChangeNotifier {
  final repository = BookRepository();
  late BookState _bookState;

  BookStoreProvider() {
    _bookState = BookState.init();
  }

  BookState get bookState => _bookState;

  Future<void> fetchBooks() async {
    final books = await repository.fetchBooks();
    _bookState = _bookState.copyWith(books: books);
    notifyListeners();
  }

  void toggleFavorite(BookModel book) {
    final booksFavorites = _bookState.booksFavorites;
    if (booksFavorites.contains(book)) {
      booksFavorites.remove(book);
    } else {
      booksFavorites.add(book);
    }
    _bookState = _bookState.copyWith(booksFavorites: booksFavorites);
    notifyListeners();
  }

  bool isFavorite(BookModel book) {
    return _bookState.booksFavorites.contains(book);
  }

  void clearFavorites() {
    _bookState = _bookState.copyWith(booksFavorites: []);
    notifyListeners();
  }
}
