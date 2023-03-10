class Tarefa {
  final String title;
  bool finished = false;
  final DateTime creation;
  final DateTime? validity;

  Tarefa({required this.title, required this.creation, this.validity});
}
