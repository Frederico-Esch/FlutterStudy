class TODO {
  String text = "";
  bool marked = false;
  TODO(this.text, [this.marked = false]);

  static TODO fromString(List<String> lista) {
    if (lista[0] == "true") {
      return TODO(lista[1], true);
    } else {
      return TODO(lista[1], false);
    }
  }

  List<String> toListString() => <String>[marked.toString(), text];
}
