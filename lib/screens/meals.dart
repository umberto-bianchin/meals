import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

/// A screen that displays a list of meals.
///
/// The `MealsScreen` is a `StatelessWidget` that takes a list of meals
/// and displays them in a `ListView` using the `MealItem` widget. If a `title`
/// is provided, it appears in the AppBar as the screen's title. Users can tap
/// on a meal item to navigate to the `MealDetailsScreen` where the meal's
/// details are displayed.
class MealsScreen extends StatelessWidget {
  /// Creates a [MealsScreen] instance.
  ///
  /// The [key] parameter is optional and represents the widget's key.
  /// The [title] parameter is optional and represents the title to be displayed
  /// in the AppBar.
  /// The [meals] parameter is required and represents the list of meals to be
  /// displayed in the ListView.
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  /// The title to be displayed in the AppBar. If `null`, no AppBar is shown.
  final String? title;

  /// The list of meals to be displayed in the ListView.
  final List<Meal> meals;

  /// Callback function to handle the selection of a meal item.
  ///
  /// When a meal item is selected, this function is called, and it navigates
  /// to the `MealDetailsScreen` to show the meal's details.
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            onSelectMeal: (meal) {
              selectMeal(context, meal);
            }),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
