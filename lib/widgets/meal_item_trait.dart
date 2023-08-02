import 'package:flutter/material.dart';

/// A widget representing a row that displays an icon and a label for a specific trait or characteristic of a meal.
///
/// The `MealItemTrait` widget is used to display various traits of a meal, such as whether it is gluten-free, lactose-free, vegan, etc. It consists of a row containing an `Icon` and a `Text` widget. The `icon` parameter specifies the icon to be displayed, and the `label` parameter represents the text label associated with the trait.
class MealItemTrait extends StatelessWidget {
  /// Creates a [MealItemTrait] instance.
  ///
  /// The [key] parameter is optional and represents the widget's key.
  /// The [icon] parameter is required and specifies the icon to be displayed in the row.
  /// The [label] parameter is required and represents the text label associated with the trait.
  const MealItemTrait({super.key, required this.icon, required this.label});

  /// The icon to be displayed in the row.
  final IconData icon;

  /// The text label associated with the trait.
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
