import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarefas/models/tarefa.dart';

class CreateTarefaScreen extends StatefulWidget {
  const CreateTarefaScreen({Key? key}) : super(key: key);

  @override
  State<CreateTarefaScreen> createState() => _CreateTarefaScreenState();
}

class _CreateTarefaScreenState extends State<CreateTarefaScreen> {
  final controller = TextEditingController();
  final today =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  late DateTime validity;
  var buttonText = "Salvar";

  _CreateTarefaScreenState() {
    validity = today;
  }

  void _saveTarefa(String title, bool withValidity) {
    final addTarefa =
        ModalRoute.of(context)!.settings.arguments as void Function(Tarefa);
    if (withValidity) {
      addTarefa(
          Tarefa(title: title, creation: DateTime.now(), validity: validity));
    } else {
      addTarefa(Tarefa(title: title, creation: DateTime.now()));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar Tarefa"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: "Título",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 5,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Validade:",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 250,
              child: CupertinoDatePicker(
                minimumDate: today,
                maximumDate: DateTime.now().add(const Duration(days: 31)),
                initialDateTime: DateTime.now(),
                dateOrder: DatePickerDateOrder.dmy,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime value) {
                  final date = DateTime(value.year, value.month, value.day);
                  validity = date;
                  if (validity != today) {
                    buttonText = "Salvar sem validade";
                  } else {
                    buttonText = "Salvar";
                  }
                  setState(() {});
                },
              ),
            ),
            Row(
              mainAxisAlignment: validity == today
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceEvenly,
              children: [
                validity != today
                    ? ElevatedButton(
                        onPressed: () => _saveTarefa(controller.text, true),
                        child: const Text("Salvar com validade"),
                      )
                    : Container(),
                ElevatedButton(
                    onPressed: () => _saveTarefa(controller.text, false),
                    child: Text(buttonText))
              ],
            )
          ],
        ),
      ),
    );
  }
}
