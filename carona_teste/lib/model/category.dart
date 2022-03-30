import 'package:carona_teste/utils/type_controller.dart';
import 'package:flutter/material.dart';

class Category {
  final String title;
  final MaterialColor cor;
  final String destination;
  final CaronaType? destinationOp;

  Category(this.title, this.cor, this.destination, [this.destinationOp]);
}
