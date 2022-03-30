import 'package:flutter/material.dart';

class Elements extends StatefulWidget {
  const Elements({Key? key}) : super(key: key);

  @override
  _ElementsState createState() => _ElementsState();
}

class _ElementsState extends State<Elements> {
  bool _buttonPressed = false;
  double radius = 10;

  double mapNums(
          double num, double max, double min, double tmax, double tmin) =>
      (tmax - tmin) * (num - min) / (max - min) + tmin;

  Matrix4 matrix = Matrix4.identity();

  var cor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teste"),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed("/botao"),
            icon: const Icon(Icons.arrow_circle_right_outlined),
          )
        ],
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          print("Dx ${details.delta.dx}");
          print("Dy ${details.delta.dy}");
          matrix.rotateX(mapNums(details.delta.dy, 50, -50, -1, 1));
          matrix.rotateY(mapNums(details.delta.dx, 50, -50, 1, -1));
          setState(() {});
        },
        onTap: () => setState(() {
          matrix.setIdentity();
        }),
        child: Container(
          color: Colors.white,
          child: Center(
            child: Transform(
              transform: matrix,
              alignment: FractionalOffset.center,
              child: Container(
                width: 150,
                height: 250,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(colors: [
                    Colors.black,
                    Colors.red,
                    Colors.green,
                    Colors.blue,
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
