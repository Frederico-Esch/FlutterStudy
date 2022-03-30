import 'package:flutter/material.dart';

class Botao extends StatefulWidget {
  const Botao({Key? key}) : super(key: key);

  //final AnimationController = animation;

  @override
  State<Botao> createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  double width = 100;
  double radius = 10;
  var cor = Colors.blue;
  bool shadow = true;
  static const animationTime = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Botao"),
      ),
      backgroundColor: Colors.grey.shade500,
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: animationTime),
          height: 100,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade500,
            boxShadow: shadow
                ? [
                    BoxShadow(
                      color: Colors.grey.shade900,
                      offset: const Offset(3, 3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      offset: Offset(-3, -3),
                      color: Colors.white,
                      blurRadius: 5,
                    )
                  ]
                : null,
          ),
          clipBehavior: Clip.hardEdge,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  shadow = false;
                });
                Future.delayed(const Duration(milliseconds: animationTime + 50))
                    .then((value) => setState(() {
                          shadow = true;
                        }));
              },
            ),
          ),
        ),
      ),
    );
  }
}
