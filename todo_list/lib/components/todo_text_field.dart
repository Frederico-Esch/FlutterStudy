import 'package:flutter/material.dart';

class TodoTextFild extends StatelessWidget {
  final TextEditingController textField;
  final double width;
  final void Function() func;
  const TodoTextFild(
      {Key? key,
      required this.textField,
      required this.func,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 8 * width / 10,
            child: TextField(
              controller: textField,
            ),
          ),
          SizedBox(
            width: 2 * width / 10,
            child: ElevatedButton(
              onPressed: func,
              child: const Icon(Icons.check),
              style: ElevatedButton.styleFrom(primary: Colors.amber[800]),
            ),
          )
        ],
      ),
    );
  }
}
