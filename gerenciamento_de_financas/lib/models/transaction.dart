class Transaction {
  int id;
  double valor;
  String nome;
  DateTime data;
  bool entrada;

  Transaction(
      {required this.id,
      required this.nome,
      required this.valor,
      required this.data,
      this.entrada = false});
}
