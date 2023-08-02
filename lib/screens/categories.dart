import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/meal.dart';

/// A screen that displays a grid of meal categories.
///
/// The `CategoriesScreen` is a stateless widget that takes a [List] of [Meal]
/// instances as [availableMeals]. It displays the available meal categories in a
/// grid using the `GridView` widget. When a category is selected, it navigates to
/// the [MealsScreen], passing the list of meals that belong to the selected category.
class CategoriesScreen extends StatelessWidget {
  /// Creates a [CategoriesScreen] instance with the provided [availableMeals].
  ///
  /// The [availableMeals] parameter is a [List] of [Meal] instances that contains
  /// all the available meals in the application.
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  /// A list of available meals in the application.
  final List<Meal> availableMeals;

  /// Function to handle category selection.
  ///
  /// The `_selectCategory` function takes [context] and a [category] as input
  /// and filters the [availableMeals] to get the list of meals that belong to
  /// the selected category. It then navigates to the [MealsScreen], passing the
  /// title of the selected category and the filtered list of meals as arguments.
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // Iterate through the available categories and create a CategoryGridItem
        // widget for each category.
        for (final category in availableCategories)
          CategoryGridItem(
              category: category,
              onSelectCategory: () {
                // Call the _selectCategory function when a category is selected.
                _selectCategory(context, category);
              }),
      ],
    );
  }
}
