import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_escribo_app/src/presentation/widgets/card_cover_book.dart';
import 'package:teste_escribo_app/src/stores/book_store_provider.dart';

class BookListPage extends StatefulWidget {
  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final bookStore = BookStoreProvider();

  @override
  void initState() {
    super.initState();
    bookStore.addListener(_listener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      bookStore.fetchBooks();
    });
  }

  void _listener() {
    setState(() {});
  }

  @override
  void dispose() {
    bookStore.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _provider = Provider.of<BookStoreProvider>(context);
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: bookStore.bookState.books.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 3 / 5,
                  ),
                  itemCount: bookStore.bookState.books.length,
                  itemBuilder: (_, index) {
                    final book = bookStore.bookState.books[index];
                    return CardCoverBook(book: book, provider: _provider);
                  },
                ),
        ),
      ),
    );
  }
}
