import 'package:flutter/material.dart';
import 'package:flutter_menu_app/models/meal.dart';
import 'package:flutter_menu_app/screens/categories_screen.dart';
import 'package:flutter_menu_app/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  List<Meal> favorites = [];

  void _selectpage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      if (favorites.contains(meal)) {
        favorites.remove(meal);
      } else {
        favorites.add(meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      toggleFavorite: _toggleFavorite,
    );
    var activePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        "Favorites",
        favorites,
        _toggleFavorite,
      );
      activePageTitle = "Favorites";
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            activePageTitle,
          ),
        ),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _selectpage(index),
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favorites",
            ),
          ],
        ));
  }
}
