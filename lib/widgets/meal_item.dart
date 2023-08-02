import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:meals/models/meal.dart';

/// A widget representing a card displaying details of a meal.
///
/// The `MealItem` widget is used to show various details of a meal, including its image, title, duration, complexity, and affordability. It displays a card with a meal image at the top, followed by the meal's title and attributes at the bottom. The widget is wrapped in an `InkWell`, allowing it to be tappable.
class MealItem extends StatelessWidget {
  /// Creates a [MealItem] instance.
  ///
  /// The [key] parameter is optional and represents the widget's key.
  /// The [meal] parameter is required and contains the meal object to display.
  /// The [onSelectMeal] parameter is required and is a callback function to handle the tap event when the meal card is tapped.
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  /// The meal object to display.
  final Meal meal;

  /// A callback function to handle the tap event when the meal card is tapped.
  final void Function(Meal meal) onSelectMeal;

  /// Gets the complexity of the meal as text.
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  /// Gets the affordability of the meal as text.
  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min'),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
