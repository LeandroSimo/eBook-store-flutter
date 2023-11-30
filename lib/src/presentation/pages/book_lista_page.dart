import 'package:flutter/material.dart';

class BookListPage extends StatefulWidget {
  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Book List'),
      ),
    );
  }
}
