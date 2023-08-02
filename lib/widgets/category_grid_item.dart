import 'package:flutter/material.dart';

import 'package:meals/models/category.dart';

/// A widget representing a grid item displaying a category.
///
/// The `CategoryGridItem` widget is used to display a single category in a grid format. It includes a `Category` object to hold information about the category and a callback function `onSelectCategory` that is triggered when the category item is tapped. The category is displayed with a gradient background using the `LinearGradient` widget and includes the category title at the center.
class CategoryGridItem extends StatelessWidget {
  /// Creates a [CategoryGridItem] instance.
  ///
  /// The [key] parameter is optional and represents the widget's key.
  /// The [category] parameter is required and holds information about the category to be displayed.
  /// The [onSelectCategory] parameter is required and is a callback function triggered when the category item is tapped.
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  /// The category object holding information about the category to be displayed.
  final Category category;

  /// A callback function triggered when the category item is tapped.
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
