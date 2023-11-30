import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:teste_escribo_app/src/presentation/views/tab_bar_view_screen.dart';
import 'package:teste_escribo_app/src/stores/book_store_provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookStoreProvider>(
            create: (_) => BookStoreProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eBook Store',
        theme: ThemeData(useMaterial3: true),
        home: const TabBarViewScreen(),
      ),
    );
  }
}
