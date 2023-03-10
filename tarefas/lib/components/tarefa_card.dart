import 'package:flutter/material.dart';
import 'package:tarefas/models/tarefa.dart';

class TarefaCard extends StatefulWidget {
  final Tarefa tarefa;
  final void Function() deleteFunc;
  const TarefaCard({Key? key, required this.tarefa, required this.deleteFunc})
      : super(key: key);

  @override
  State<TarefaCard> createState() => _TarefaCardState();
}

class _TarefaCardState extends State<TarefaCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.tarefa.title + widget.tarefa.creation.toString()),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                value: widget.tarefa.finished,
                onChanged: (value) => setState(
                  () =>
                      widget.tarefa.finished = value ?? !widget.tarefa.finished,
                ),
              ),
              Flexible(
                child: Text(
                  widget.tarefa.title,
                  style: widget.tarefa.finished
                      ? const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey)
                      : const TextStyle(fontSize: 20),
                ),
              ),
              IconButton(
                onPressed: widget.deleteFunc,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          widget.deleteFunc();
        }
        setState(() {});
      },
      confirmDismiss: (direction) {
        if (direction == DismissDirection.startToEnd) {
          return Future(() => true);
        } else {
          widget.tarefa.finished = !widget.tarefa.finished;
          setState(() {});
          return Future(() => false);
        }
      },
      direction: DismissDirection.horizontal,
    );
  }
}
