import 'package:flutter/material.dart';
import 'dart:core';

import 'package:first_quiz/question_standard.dart';
import 'question_color.dart';
import 'question_standard.dart';

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

void main() => runApp(QuizzMainFrame());

class QuizzMainFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
        home: QuizzFrame()
    );
  }
}

class QuizzFrame extends StatefulWidget {
  const QuizzFrame({Key? key}) : super(key: key);

  @override
  _QuizzFrameState createState() => _QuizzFrameState();
}

class _QuizzFrameState extends State<QuizzFrame> {
  final GlobalKey<_QuizzState> _key = GlobalKey();

  static const _boarder = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)));

  final appbar = AppBar(
    centerTitle: true,
    shape: _boarder,
    title: const Text("Quizz!"),
    titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
    elevation: 0,
    backgroundColor: Colors.blue[800],
  );

  @override
  Widget build(BuildContext context) {
    var quizz = Quizz(key: _key, refresh: () => setState((){}));

    return Scaffold(
      appBar: appbar,
      body: quizz,
      floatingActionButton: (_key.currentState == null || !_key.currentState?.questionIsNotEmpty) ? null : FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios),
        onPressed: () => _key.currentState?.back(),
      )
    );
  }
}


class Quizz extends StatefulWidget {
  final Function() refresh;
  const Quizz({Key? key, required this.refresh}) : super(key: key);

  @override
  _QuizzState createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  var question = <int>[];

  final _answers = [
    ["Red", "Blue", "Green", "Pink", "Purple"],
    ["Apple 🍎", "Banana 🍌", "Peach 🍑", "Grape 🍇", "Strawberry 🍓"],
    ["Bat 🦇", "Wolf 🐺", "Monkey 🐵", "Dog 🐶", "Cat 🐱"]
  ];

  void back() {
    setState(() => question.removeLast());
    widget.refresh();
  }

  get questionIsNotEmpty => question.isNotEmpty;
  void questionAdd(int num) {
    question.add(num);
    widget.refresh();
  }

  @override
  Widget build(BuildContext context) {
    switch (question.length) {
      case 0:
        return QuestionColor((int num) => setState(() => questionAdd(num)));
      case 1:
        return QuestionStd(
            question: "What's your favourite fruit?",
            ans: _answers[1],
            fn: (int num) => setState(() => questionAdd(num))
        );
      case 2:
        return QuestionStd(
          question: "What's your favourite animal?",
          ans: _answers[2],
          fn: (int num) => setState(() => questionAdd(num))
        );
      default:
        return Text(question.mapIndexed((ans, ques) => _answers[ques][ans]).toString());
    }
  }

}
