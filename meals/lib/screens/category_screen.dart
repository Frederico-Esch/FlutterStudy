import 'package:flutter/material.dart';
import 'package:meals/components/category_item.dart';

//DUMMY VARIABLES
import 'package:meals/data/dummy_data.dart';
//DUMMY VARIABLES

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vamos Cozinhar?"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        padding: const EdgeInsets.all(20),
        itemCount: DUMMY_CATEGORIES.length,
        itemBuilder: (context, index) {
          final category = DUMMY_CATEGORIES[index];
          return CategoryItem(category: category);
        },
      ),
    );
  }
}
