import 'package:carona_teste/model/category.dart';
import 'package:carona_teste/utils/type_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardNavigation extends StatelessWidget {
  final Category category;
  final bool disabled;
  final bool navigate;
  late final String title;
  late final String destination;
  late final MaterialColor cor;
  bool inDrawer;
  CardNavigation({
    Key? key,
    required this.category,
    this.inDrawer = false,
    this.disabled = false,
    this.navigate = true,
  }) : super(key: key) {
    title = category.title;
    cor = category.cor;
    destination = category.destination;
  }

  void _navigateTo(BuildContext context) {
    //print("Navigated to $destination");
    if (inDrawer) Navigator.pop(context);
    if (category.destinationOp != null) {
      final controller = context.read<TypeController>();
      controller.type = category.destinationOp!;
      if (navigate) {
        Navigator.popAndPushNamed(context, destination,
            arguments: category.destinationOp);
      }
    } else {
      Navigator.popAndPushNamed(context, destination);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: inDrawer
          ? const BoxConstraints(minHeight: 75)
          : const BoxConstraints(minHeight: 0),
      child: Card(
        elevation: inDrawer ? 0 : 5,
        shape: inDrawer
            ? null
            : RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: disabled ? null : () => _navigateTo(context),
          splashColor: cor,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: disabled
                    ? [Colors.grey.withOpacity(0.1), Colors.grey]
                    : [cor.withOpacity(.9), cor.withOpacity(.5)],
              ),
            ),
            child: Flexible(
              fit: FlexFit.loose,
              child: Text(
                title,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
