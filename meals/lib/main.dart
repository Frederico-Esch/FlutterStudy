import 'package:flutter/material.dart';
import 'package:meals/screens/category_screen.dart';

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
        //primarySwatch: Colors.green,
        colorScheme: const ColorScheme.light(
          primary: Colors.orange,
          onPrimary: Colors.white,
          secondary: Colors.red,
          onSecondary: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.orange.shade300,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals"),
        centerTitle: true,
      ),
      body: const Center(
        child: CategoryScreen(),
      ),
    );
  }
}
