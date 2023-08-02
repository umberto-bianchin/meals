import 'package:flutter/material.dart';

/// A widget representing the navigation drawer for the app.
///
/// The `MainDrawer` widget provides a navigation drawer that contains two items: "Meals" and "Filters." Each item is represented by a `ListTile` with an icon and text. When the user taps on an item, the `onSelectScreen` callback is triggered with the corresponding identifier ("meals" or "filters").
class MainDrawer extends StatelessWidget {
  /// Creates a [MainDrawer] instance.
  ///
  /// The [key] parameter is optional and represents the widget's key.
  /// The [onSelectScreen] parameter is required and is a callback function triggered when the user taps on an item in the navigation drawer. It receives a string identifier as an argument, which can be either "meals" or "filters" based on the selected item.
  const MainDrawer({
    super.key,
    required this.onSelectScreen,
  });

  /// A callback function triggered when the user taps on an item in the navigation drawer. It receives a string identifier as an argument, which can be either "meals" or "filters" based on the selected item.
  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
