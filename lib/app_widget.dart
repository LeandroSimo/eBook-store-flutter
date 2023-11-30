import 'package:flutter/material.dart';

import 'package:teste_escribo_app/src/pages/book_lista_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookListPage(),
    );
  }
}
