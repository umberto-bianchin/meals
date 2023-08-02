import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

/// Initial filters to be used when no filters are applied.
const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

/// A screen that displays a BottomNavigationBar with tabs for categories and favorites.
///
/// The `TabsScreen` is a `ConsumerStatefulWidget` that listens to the state of filtered meals and favorite meals using `filteredMealsProvider` and `favoriteMealsProvider`. It displays a `BottomNavigationBar` that allows the user to navigate between two screens: `CategoriesScreen` and `MealsScreen`. The `CategoriesScreen` displays a grid of meal categories, while the `MealsScreen` shows a list of the user's favorite meals. The screen also includes a `MainDrawer` that provides access to the filters screen.
class TabsScreen extends ConsumerStatefulWidget {
  /// Creates a [TabsScreen] instance.
  ///
  /// The [key] parameter is optional and represents the widget's key.
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  /// Navigates to the filters screen and waits for the user to make selections.
  ///
  /// When the user selects the "filters" option from the MainDrawer, this function is called, and it opens the filters screen using `Navigator.of(context).push`. It waits for the user to make selections on the filters screen and returns the chosen filters.
  Future<void> _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
