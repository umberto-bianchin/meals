import 'package:flutter/material.dart';

/// A class that represents a category of meals.
class Category {
  /// Creates a [Category] instance.

  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  /// A unique identifier for the category.
  final String id;

  /// The name or title of the category.
  final String title;

  /// The primary color associated with the category.
  ///
  /// The default color is [Colors.orange].
  final Color color;
}
