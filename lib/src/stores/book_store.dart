import 'package:flutter/material.dart';
import 'package:teste_escribo_app/src/repositories/book_repository.dart';
import 'package:teste_escribo_app/src/states/book_state.dart';

class BookStore extends ValueNotifier<BookState> {
  final repository = BookRepository();

  BookStore() : super(BookState.init());

  Future<void> fetchBooks() async {
    final books = await repository.fetchBooks();
    value = value.copyWith(books: books);
  }
}
