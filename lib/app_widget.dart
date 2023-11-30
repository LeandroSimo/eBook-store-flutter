import 'package:flutter/material.dart';

import 'package:teste_escribo_app/src/presentation/views/tab_bar_view_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eBook Store',
      theme: ThemeData(useMaterial3: true),
      home: const TabBarViewScreen(),
    );
  }
}
