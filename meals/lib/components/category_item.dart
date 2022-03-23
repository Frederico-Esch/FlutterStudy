import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/utils/app_routs.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(AppRouts.MEALS, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [category.color, category.color.withOpacity(.5)],
            transform: const GradientRotation(pi / 4),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).colorScheme.secondary,
      onTap: () => _selectCategory(context),
    );
  }
}
