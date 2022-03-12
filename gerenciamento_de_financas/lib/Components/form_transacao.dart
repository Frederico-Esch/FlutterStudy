import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormTransacao extends StatefulWidget {
  final void Function(String?, String?, bool, DateTime, BuildContext) submit;

  const FormTransacao({Key? key, required this.submit}) : super(key: key);

  @override
  State<FormTransacao> createState() => _FormTransacaoState();
}

class _FormTransacaoState extends State<FormTransacao> {
  final nomeController = TextEditingController();

  final valorController = TextEditingController();

  bool checkBoxController = false;
  
  DateTime? data;

  void _showDatePicker(){
    showDatePicker(
      context: context,
      initialDate: data ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      builder: (BuildContext ctx, Widget? child) {
        return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.indigoAccent,
                onPrimary: Colors.white,
                surface: Colors.indigo.shade900
              ),
            ),
            child: child ?? const Text("IDK")
        );
      }
    ).then((value) => setState(() => data = value ?? data));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nomeController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo[200]!, width: 1)),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo, width: 1)),
                labelText: "Nome"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: valorController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigoAccent[100]!)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.indigoAccent)),
                  labelStyle: TextStyle(color:Colors.white),
                  labelText: "Valor",
              ),
              keyboardType: TextInputType.number,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                data != null
                    ? Text("Data: ${DateFormat("dd/MM/yy").format(data!)}")
                    : const Text("Data ainda não Selecionada"),
                ElevatedButton(
                  onPressed: _showDatePicker,
                  child: Text(
                    "Selecionar Data",
                    style: TextStyle(color: Colors.indigoAccent.shade100),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.grey.withAlpha(100)
                  ),
                ),
              ],
            )
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: checkBoxController,
                      onChanged: (value) => setState(() {checkBoxController = value ?? false;}),
                      activeColor: Colors.greenAccent[700],
                      side: const BorderSide(color: Colors.red, width: 2),
                    ),
                    const Text("Entrada"),
                  ],
                ),
                ElevatedButton(
                    onPressed: () => widget.submit(nomeController.text, valorController.text, checkBoxController, data??DateTime.now(), context),
                    child: const Text("Confirmar"),
                    style: ElevatedButton.styleFrom(elevation: 0, primary: Colors.indigo),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
