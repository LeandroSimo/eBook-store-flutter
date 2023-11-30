import 'package:flutter/material.dart';
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
}
