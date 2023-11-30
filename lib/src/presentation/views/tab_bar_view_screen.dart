import 'package:flutter/material.dart';
import 'package:teste_escribo_app/src/presentation/pages/book_list_favorites_page.dart';
import 'package:teste_escribo_app/src/presentation/pages/book_list_page.dart';

class TabBarViewScreen extends StatefulWidget {
  const TabBarViewScreen({super.key});

  @override
  State<TabBarViewScreen> createState() => _TabBarViewScreenState();
}

class _TabBarViewScreenState extends State<TabBarViewScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'eBook Store',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.purple.shade900,
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                icon: Icon(Icons.book),
                text: 'Books',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorites',
              ),
            ],
          )),
      body: TabBarView(
        controller: _tabController,
        children: [
          BookListPage(),
          const BookListFavoritesPage(),
        ],
      ),
    );
  }
}
