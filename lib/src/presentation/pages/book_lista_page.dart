import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 3 / 3.5,
            ),
            itemCount: bookStore.bookState.books.length,
            itemBuilder: (_, index) {
              final book = bookStore.bookState.books[index];
              return Card(
                elevation: 4,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        book.cover_url,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.black54,
                        child: Column(
                          children: [
                            Text(
                              book.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              book.author,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
