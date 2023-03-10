import 'package:flutter/material.dart';
import 'package:tarefas/components/tarefa_card.dart';
import 'package:tarefas/models/tarefa.dart';
import 'package:tarefas/utils/routs.dart';

class ListTarefaScreen extends StatefulWidget {
  const ListTarefaScreen({Key? key}) : super(key: key);

  @override
  State<ListTarefaScreen> createState() => _ListTarefaScreenState();
}

class _ListTarefaScreenState extends State<ListTarefaScreen> {
  final tarefas = <Tarefa>[
    Tarefa(
      title:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus maximus felis. In aliquam posuere libero hendrerit auctor. Integer in.",
      creation: DateTime.now(),
    )
  ];

  void deleteTarefa(Tarefa tarefa) {
    tarefas.remove(tarefa);
    setState(() {});
  }

  void addTarefa(Tarefa tarefa) => setState(() => tarefas.add(tarefa));

  @override
  Widget build(BuildContext context) {
    tarefas.removeWhere(
        (tarefa) => !(tarefa.validity?.isAfter(DateTime.now()) ?? true));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routs.createTarefa,
                arguments: addTarefa),
            icon: const Icon(Icons.create),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TarefaCard(
                key: Key(
                  tarefas[index].title + tarefas[index].creation.toString(),
                ),
                tarefa: tarefas[index],
                deleteFunc: () => deleteTarefa(tarefas[index])),
          );
        },
      ),
    );
  }
}
