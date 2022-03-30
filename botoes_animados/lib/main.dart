import 'dart:ui';
import 'package:botoes_animados/screens/botao.dart';
import 'package:botoes_animados/screens/rotate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const Elements(),
      initialRoute: "/",
      routes: {
        "/": (ctx) => const Elements(),
        "/botao": (ctx) => const Botao(),
      },
    );
  }
}
