import 'package:flutter/material.dart';

class QuestionStd extends StatelessWidget {
  final void Function(int num)? fn;
  final String? question;
  final List<String>? ans;

  const QuestionStd({this.question, this.ans,this.fn, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text("What's your favorite fruit?", style: TextStyle(color: Colors.black, fontSize: 24),),
          QuestionStdButton(ans![0], () => fn!(0)),
          QuestionStdButton(ans![1], () => fn!(1)),
          QuestionStdButton(ans![2], () => fn!(2)),
          QuestionStdButton(ans![3], () => fn!(3)),
          QuestionStdButton(ans![4], () => fn!(4)),
          //FloatingActionButton(child: const Icon(Icons.arrow_back_ios), backgroundColor: Colors.black, onPressed: () => back!()),
        ],
      ),
    );
  }
}

class QuestionStdButton extends ElevatedButton {
  QuestionStdButton(String name, void Function() onPressed) : super(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
    child: Text(name, style: const TextStyle(color:Colors.black),),
  );
}
