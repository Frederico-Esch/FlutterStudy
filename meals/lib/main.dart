import 'package:flutter/material.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/utils/app_routs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
              ),
            ),
      ),
      routes: {
        AppRouts.HOME: (ctx) => const CategoryScreen(),
        AppRouts.MEALS: (ctx) => const CategoryMealsScreen(),
      },
    );
  }
}
