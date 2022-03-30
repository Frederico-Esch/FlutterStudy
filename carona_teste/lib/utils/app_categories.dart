import 'package:carona_teste/model/category.dart';
import 'package:carona_teste/utils/type_controller.dart';
import 'package:flutter/material.dart';

class Categories {
  // ignore: non_constant_identifier_names
  static final Logar = Category("Logar", Colors.red, "/logar");
  // ignore: non_constant_identifier_names
  static final CAPOB =
      Category("CAP - Ouro Branco", Colors.blue, "/carona", CaronaType.capob);
  // ignore: non_constant_identifier_names
  static final OBCAP =
      Category("Ouro Branco - CAP", Colors.green, "/carona", CaronaType.obcap);
  // ignore: non_constant_identifier_names
  static final CARONA =
      Category("Oferecer carona", Colors.amber, "/carona", CaronaType.oferecer);
}
