import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

/// A provider to provide a list of meals.
///
/// This provider creates a constant [List] of [Meal] instances using the data
/// from the [dummyMeals] list in `dummy_data.dart`. It allows other widgets in the
/// application to access the list of meals as read-only data. Any widget that
/// listens to this provider will be rebuilt if the list of meals changes.
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
