import 'package:flutter/material.dart';
import 'components/enter_new_todo.dart';

void main() => runApp(const MainFrame());

class MainFrame extends StatelessWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Seila"),
            backgroundColor: Colors.amber,
          ),
          body: const EnterNewTodo()),
    );
  }
}
