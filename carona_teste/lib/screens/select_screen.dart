import 'package:carona_teste/components/card_navigation.dart';
import 'package:carona_teste/utils/app_categories.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selecione"),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: const EdgeInsets.all(10),
          children: [
            CardNavigation(category: Categories.Logar),
            CardNavigation(category: Categories.CAPOB),
            CardNavigation(category: Categories.OBCAP),
            CardNavigation(category: Categories.CARONA),
          ],
        ),
      ), // logar, cap-ob, ob-cap, oferecer-carona
    );
  }
}
