import 'package:flutter/material.dart';

class QuestionColor extends StatelessWidget {
  Function? fn;

  QuestionColor(void function(int num)){
    fn = function;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text("Whats your favorite color?", style: TextStyle(color: Colors.black, fontSize: 24),),
          QuestionColorButton("Red", Colors.red, () => fn!(0)),
          QuestionColorButton("Blue", Colors.blue[900], () => fn!(1)),
          QuestionColorButton("Green", Colors.green, () => fn!(2)),
          QuestionColorButton("Pink", Colors.pink, () => fn!(3)),
          QuestionColorButton("Purple", Colors.purple[900], () => fn!(4)),
        ],
      ),
    );
  }
}

class QuestionColorButton extends ElevatedButton {
  QuestionColorButton(String name, Color? color , void Function() onPressed) : super(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(name + " ", style: const TextStyle(color: Colors.black),),
        Icon(Icons.circle, color:color)
      ],
    ),
  );
}
