import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String text;
  const DividerWithText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.indigo, height: 10,)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
        const Expanded(child: Divider(color: Colors.indigo, height: 10,))
      ],
    );
  }
}
