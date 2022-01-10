import 'package:flutter/material.dart';
import 'package:todo_list/models/todo_item.dart';

class TodoCard extends StatelessWidget {
  final TODO item;
  final int id;
  final void Function(int, bool?) func;
  const TodoCard({
    Key? key,
    required this.item,
    required this.id,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(2, 5),
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Row(
        children: [
          Checkbox(
            value: item.marked,
            onChanged: (bool? value) => func(id, value),
            activeColor: Colors.amber,
          ),
          Text(
            item.text,
            style: (item.marked)
                ? TextStyle(
                    color: Colors.grey[600],
                    decoration: TextDecoration.lineThrough,
                    fontSize: 18)
                : const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
