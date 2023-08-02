import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs.dart';

// Custom theme definition for the "Meals" app
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

// Main function of the Flutter app
void main() {
  // Run the Flutter app within a "ProviderScope"
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

// Main widget of the "Meals" app
class App extends StatelessWidget {
  // Constructor for the "App" widget
  const App({super.key});

  // Method to build the user interface of the "Meals" app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set the custom theme defined above as the main theme of the app
      theme: theme,
      // Set the "TabsScreen" widget as the home screen of the app
      home: const TabsScreen(),
    );
  }
}
