import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';

/// A state notifier responsible for managing a list of favorite meals.
///
/// The [FavoriteMealsNotifier] maintains a list of [Meal] instances that the user
/// has marked as favorite. It provides a function to toggle the favorite status
/// of a meal, adding it to the list if not already favorite, and removing it
/// from the list if it is already a favorite.
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  /// Creates a new [FavoriteMealsNotifier] instance with an initial empty list.
  FavoriteMealsNotifier() : super([]);

  /// Toggles the favorite status of a meal.
  ///
  /// If the provided [meal] is already marked as a favorite, it will be removed
  /// from the list. If the meal is not a favorite, it will be added to the list
  /// of favorite meals.
  ///
  /// Returns `true` if the [meal] is added as a new favorite, and `false` if the
  /// [meal] is removed from the list of favorite meals.
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

/// A provider for the [FavoriteMealsNotifier] to manage the list of favorite meals.
///
/// This provider creates an instance of [FavoriteMealsNotifier] and allows other
/// widgets in the application to access and modify the list of favorite meals.
/// Any widget that listens to this provider will be rebuilt when the list of
/// favorite meals changes.
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
