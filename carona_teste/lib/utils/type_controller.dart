import 'package:carona_teste/model/carona.dart';
import 'package:flutter/cupertino.dart';

enum CaronaType { obcap, capob, oferecer, idle }

class TypeController extends ChangeNotifier {
  CaronaType _type = CaronaType.idle;
  set type(CaronaType newType) {
    _type = newType;
    notifyListeners();
  }

  CaronaType get type => _type;
  void notify() => notifyListeners();
}
