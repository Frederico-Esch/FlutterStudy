import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final meals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(category.id));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Receitas"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Center(
          child: Text(meals.elementAt(index).title),
        ),
        itemCount: meals.length,
      ),
    );
  }
}
