import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_escribo_app/src/stores/book_store_provider.dart';

class BookListFavoritesPage extends StatelessWidget {
  const BookListFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<BookStoreProvider>(context);
    final books = _provider.getFavorites();

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: books.isEmpty
              ? const Center(
                  child: Text(
                    'Não há favoritos',
                    style: TextStyle(
                      // fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 3 / 3.5,
                  ),
                  itemCount: books.length,
                  itemBuilder: (_, index) {
                    final book = books[index];
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
                              icon: Icon(
                                _provider.isFavorite(book)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: _provider.isFavorite(book)
                                    ? Colors.red
                                    : Colors.white,
                              ),
                              onPressed: () => _provider.toggleFavorite(book),
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
