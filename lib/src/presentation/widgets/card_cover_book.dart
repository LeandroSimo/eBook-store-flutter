import 'package:flutter/material.dart';
import 'package:teste_escribo_app/src/models/book_model.dart';
import 'package:teste_escribo_app/src/stores/book_store_provider.dart';

class CardCoverBook extends StatelessWidget {
  const CardCoverBook({
    super.key,
    required this.book,
    required BookStoreProvider provider,
    required this.onTap,
  }) : _provider = provider;

  final BookModel book;
  final BookStoreProvider _provider;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: const Color(0xFF1D1244),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(book.cover_url),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          book.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () => _provider.toggleFavorite(book),
                          icon: Icon(
                            _provider.isFavorite(book)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _provider.isFavorite(book)
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    book.author,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
