import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

/// An enumeration representing different filters for meals.
enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

/// A state notifier responsible for managing filters for meals.
///
/// The [FiltersNotifier] maintains a map of [Filter] enums and their corresponding
/// boolean values to indicate whether the filters are active or not. It provides
/// functions to set individual filters and the entire map of filters.
class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  /// Creates a new [FiltersNotifier] instance with all filters initially set to false.
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        });

  /// Sets the filters based on the provided [chosenFilters].
  ///
  /// The [chosenFilters] map contains [Filter] enums as keys and boolean values
  /// indicating whether each filter is active (true) or not (false).
  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  /// Sets a single filter to the specified [isActive] status.
  ///
  /// The [filter] parameter specifies the [Filter] enum to be set.
  /// The [isActive] parameter is a boolean value indicating whether the filter
  /// is active (true) or not (false).
  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

/// A provider for the [FiltersNotifier] to manage filters for meals.
///
/// This provider creates an instance of [FiltersNotifier] and allows other widgets
/// in the application to access and modify the filters. Any widget that listens to
/// this provider will be rebuilt when the filters change.
final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

/// A provider to generate a filtered list of meals based on active filters.
///
/// This provider retrieves the list of meals from the [mealsProvider] and the active
/// filters from the [filtersProvider]. It then filters the meals based on the
/// selected filters and returns the filtered list as a new list of meals.
final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
