import 'package:flutter/material.dart';
import 'package:tarefas/screens/create_tarefa.dart';
import 'package:tarefas/screens/list_tarefa.dart';
import 'package:tarefas/utils/routs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: {
        Routs.listTarefa: (context) => const ListTarefaScreen(),
        Routs.createTarefa: (ctx) => const CreateTarefaScreen(),
      },
      initialRoute: Routs.listTarefa,
    );
  }
}
