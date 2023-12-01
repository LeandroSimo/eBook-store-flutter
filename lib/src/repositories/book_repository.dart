import 'package:dio/dio.dart';

import 'package:teste_escribo_app/src/models/book_model.dart';

class BookRepository {
  final dio = Dio();

  Future<List<BookModel>> fetchBooks() async {
    final response =
        await dio.getUri(Uri.parse('https://escribo.com/books.json'));
    return parseBooks(response.data);
  }

  List<BookModel> parseBooks(dynamic responseBody) {
    if (responseBody is List) {
      final parsed = responseBody.cast<Map<String, dynamic>>();
      final result =
          parsed.map<BookModel>((json) => BookModel.fromJson(json)).toList();
      return result;
    } else {
      return [];
    }
  }
}
