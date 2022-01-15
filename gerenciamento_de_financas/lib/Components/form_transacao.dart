import 'package:flutter/material.dart';

class FormTransacao extends StatefulWidget {
  final void Function(String?, String?, bool, BuildContext) submit;

  const FormTransacao({Key? key, required this.submit}) : super(key: key);

  @override
  State<FormTransacao> createState() => _FormTransacaoState();
}

class _FormTransacaoState extends State<FormTransacao> {
  final nomeController = TextEditingController();

  final valorController = TextEditingController();

  bool checkBoxController = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                labelText: "Valor"
            ),
            keyboardType: TextInputType.number,
          ),
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
                  onPressed: () => widget.submit(nomeController.text, valorController.text, checkBoxController, context),
                  child: const Text("Confirmar"),
                  style: ElevatedButton.styleFrom(elevation: 0, primary: Colors.indigo),
              )
            ],
          ),
        )
      ],
    );
  }
}
