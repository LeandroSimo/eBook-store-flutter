import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_escribo_app/src/presentation/widgets/card_cover_book.dart';
import 'package:teste_escribo_app/src/stores/book_store_provider.dart';
import 'package:teste_escribo_app/src/stores/epub_store.dart';

class BookListFavoritesPage extends StatelessWidget {
  const BookListFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _epub = EpubStore();
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 3 / 5,
                  ),
                  itemCount: books.length,
                  itemBuilder: (_, index) {
                    final book = books[index];
                    return CardCoverBook(
                      book: book,
                      provider: _provider,
                      onTap: () async {
                        await _epub.download(book.download_url, context);
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}
