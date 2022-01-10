import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_list/components/todo_card.dart';
import '../models/todo_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'todo_text_field.dart';

class EnterNewTodo extends StatefulWidget {
  const EnterNewTodo({Key? key}) : super(key: key);

  @override
  State<EnterNewTodo> createState() => _EnterNewTodoState();
}

class _EnterNewTodoState extends State<EnterNewTodo> {
  final todoTextField = TextEditingController();
  var todoList = <TODO>[];
  SharedPreferences? con;

  List<Widget> displayTodos() {
    if (todoList.isEmpty) return <Widget>[];

    var result = <Widget>[];
    todoList.asMap().forEach((key, value) =>
        result.add(TodoCard(item: value, id: key, func: unMark)));
    return result;
  }

  void unMark(int id, bool? value) {
    setState(() {
      todoList[id].marked = value ?? !todoList[id].marked;
    });
  }

  void createTodo() {
    setState(() {
      if (todoTextField.text.isEmpty) return;

      todoList.add(TODO(todoTextField.text));
      todoTextField.text = "";
    });
  }

  Future loadList() async {
    con = await SharedPreferences.getInstance();
    if (con?.getKeys().contains("TODOS") ?? false) {
      todoList = TODO.fromString(con!.getStringList("TODOS")!);
    }
  }

  @override
  void initState() {
    super.initState();
    loadList().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final width =
        MediaQuery.of(context).size.width - 20; //-20 because of the padding

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        TodoTextFild(textField: todoTextField, func: createTodo, width: width),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[...displayTodos()],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void deactivate() {
    con!.setStringList("TODOS", TODO.toListString(todoList));
    super.deactivate();
  }
}
