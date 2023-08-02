enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

/// A class that represents a meal in the "Meals" app.
class Meal {
  /// Creates a [Meal] instance.
  ///
  /// All parameters are required and must be provided when creating a meal.
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  /// A unique identifier for the meal.
  final String id;

  /// The list of categories to which the meal belongs.
  final List<String> categories;

  /// The name or title of the meal.
  final String title;

  /// The URL of the image representing the meal.
  final String imageUrl;

  /// The list of ingredients required to prepare the meal.
  final List<String> ingredients;

  /// The list of steps to follow to prepare the meal.
  final List<String> steps;

  /// The duration in minutes to prepare the meal.
  final int duration;

  /// The complexity level of the meal preparation.
  final Complexity complexity;

  /// The affordability level of the meal.
  final Affordability affordability;

  /// Indicates whether the meal is gluten-free.
  final bool isGlutenFree;

  /// Indicates whether the meal is lactose-free.
  final bool isLactoseFree;

  /// Indicates whether the meal is suitable for vegans.
  final bool isVegan;

  /// Indicates whether the meal is suitable for vegetarians.
  final bool isVegetarian;
}
