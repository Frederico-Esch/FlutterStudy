import 'dart:convert';

import 'package:carona_teste/model/carona.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:intl/intl.dart';

class DataBaseController {
  static const _baseUrl =
      "https://carona-prototype-default-rtdb.firebaseio.com/";

  static get caronas async {
    http.Response response =
        await http.get(Uri.parse(_baseUrl + "caronas.json"));

    Map<String, dynamic> result = jsonDecode(response.body);
    List<Carona> _caronas = [];
    result.forEach((key, value) {
      _caronas.add(Carona.fromJson(key, value));
    });
    return _caronas;
  }
}
