import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:teste_escribo_app/src/presentation/views/tab_bar_view_screen.dart';
import 'package:teste_escribo_app/src/stores/book_store_provider.dart';
import 'package:teste_escribo_app/src/stores/epub_store.dart';

class AppWidget extends StatelessWidget {
  final SharedPreferences prefs;
  AppWidget(this.prefs);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookStoreProvider>(
          create: (_) => BookStoreProvider(prefs: prefs),
        ),
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
