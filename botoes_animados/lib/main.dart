import 'dart:ui';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Teste"),
        ),
        body: Elements()
    );
  }
}

class Elements extends StatefulWidget {
  const Elements({Key? key}) : super(key: key);

  @override
  _ElementsState createState() => _ElementsState();
}

class _ElementsState extends State<Elements> {
  bool _buttonPressed = false;
  double radius = 10;

  double mapNums(double num, double max, double min, double tmax, double tmin) => (tmax-tmin)*(num - min)/(max-min) + tmin;

  Matrix4 matrix = Matrix4.identity();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        print("Dx ${details.delta.dx}");
        print("Dy ${details.delta.dy}");
        matrix.rotateX(mapNums(details.delta.dy, 50, -50, -1, 1));
        matrix.rotateY(mapNums(details.delta.dx, 50, -50, 1, -1));
        setState((){});
      },
      onTap: () => setState((){matrix.setIdentity();}),
      child: Container(
        color: Colors.white,
        child: Center(
          child: Transform(
            transform: matrix,
            alignment: FractionalOffset.center,
            child: Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                gradient: const RadialGradient(colors: [Colors.black, Colors.red, Colors.green, Colors.blue])
              ),
            ),
          ),
        ),
      ),
    );
  }
}
