import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [category.color, category.color.withOpacity(.5)],
          transform: const GradientRotation(pi / 4),
        ),
        borderRadius: BorderRadius.circular(15),
        // boxShadow: const [
        //   BoxShadow(
        //     color: Colors.grey,
        //     offset: Offset(5, 5),
        //     blurRadius: 10,
        //     spreadRadius: 2,
        //   ),
        // ],
      ),
      child: Text(category.title),
    );
  }
}
