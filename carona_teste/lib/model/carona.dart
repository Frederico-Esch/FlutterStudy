import 'package:intl/intl.dart';

class Carona {
  final String id;
  final DateTime horario;
  final String inicio;
  final String fim;
  final String nome;
  final String cor;
  final String modelo;
  int vagas;

  bool get indoProCap => fim == "Cap";

  Carona({
    required this.id,
    required this.horario,
    required this.inicio,
    required this.fim,
    required this.nome,
    required this.cor,
    required this.modelo,
    required this.vagas,
  });

  factory Carona.fromJson(String id, Map<String, dynamic> caronaJson) {
    return Carona(
      id: id,
      nome: caronaJson["nome"] ?? "Unknown",
      horario: DateFormat.Hm().parse(caronaJson["horario"]),
      cor: caronaJson["cor"] ?? "Unknown",
      fim: caronaJson["fim"] ?? "Unknown",
      inicio: caronaJson["inicio"] ?? "Unknown",
      modelo: caronaJson["modelo"] ?? "Unknown",
      vagas: caronaJson["vagas"] as int? ?? 0,
    );
  }
}
