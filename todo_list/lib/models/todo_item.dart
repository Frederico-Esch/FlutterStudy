class TODO {
  String text = "";
  bool marked = false;
  TODO(this.text, [this.marked = false]);

  @override
  String toString() => "$marked:$text";

  static List<TODO> fromString(List<String> lista) {
    var result = <TODO>[];
    lista.forEach((element) {
      var index = element.indexOf(":");
      bool marked = element.substring(0, index) == "true" ? true : false;
      result.add(TODO(element.substring(index + 1), marked));
    });
    return result;
  }

  static List<String> toListString(List<TODO> lista) {
    var result = <String>[];

    lista.forEach((element) {
      result.add(element.toString());
    });

    return result;
  }
}
