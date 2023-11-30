import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_escribo_app/constants.dart';
import 'package:teste_escribo_app/src/models/book_model.dart';
import 'package:teste_escribo_app/src/repositories/book_repository.dart';
import 'package:teste_escribo_app/src/states/book_state.dart';

class BookStoreProvider extends ChangeNotifier {
  final repository = BookRepository();
  late BookState _bookState;

  SharedPreferences? prefs;

  BookStoreProvider({this.prefs}) {
    _bookState = BookState.init();
    getFavorites();
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
      _saveFavorites();
    } else {
      booksFavorites.add(book);
      _saveFavorites();
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

  void _saveFavorites() async {
    List<String> _listFavorites =
        _bookState.booksFavorites.map((e) => jsonEncode(e.toJson())).toList();

    await prefs!.setStringList(LIST_TOKEN, _listFavorites);
  }

  List<BookModel> getFavorites() {
    List<String> _list = prefs?.getStringList(LIST_TOKEN) ?? [];
    if (_list.isNotEmpty) {
      final List<BookModel> favorites =
          _list.map((e) => BookModel.fromJson(jsonDecode(e))).toList();

      _bookState = _bookState.copyWith(booksFavorites: favorites);
      return favorites;
    }

    return _bookState.booksFavorites;
  }
}
