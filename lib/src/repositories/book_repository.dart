import 'dart:convert';

import 'package:http/http.dart';
import 'package:teste_escribo_app/src/models/book_model.dart';

class BookRepository {
  final client = Client();

  Future<List<BookModel>> fetchBooks() async {
    final response =
        await client.get(Uri.parse('https://escribo.com/books.json'));
    return parseBooks(response.body);
  }

  List<BookModel> parseBooks(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    final result =
        parsed.map<BookModel>((json) => BookModel.fromJson(json)).toList();
    return result;
  }
}
