import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final int id;
  final String title;
  final String author;
  final String cover_url;
  final String download_url;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.cover_url,
    required this.download_url,
  });

  factory BookModel.init() {
    return BookModel(
      id: 0,
      title: '',
      author: '',
      cover_url: '',
      download_url: '',
    );
  }

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      cover_url: json['cover_url'],
      download_url: json['download_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'cover_url': cover_url,
      'download_url': download_url,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        author,
        cover_url,
        download_url,
      ];
}
