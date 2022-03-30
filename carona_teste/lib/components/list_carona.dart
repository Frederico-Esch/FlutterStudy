import 'package:carona_teste/model/carona.dart';
import 'package:carona_teste/utils/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListCarona extends StatefulWidget {
  final List<Carona> caronas;
  final Future<void> Function() reload;
  const ListCarona({Key? key, required this.caronas, required this.reload})
      : super(key: key);

  @override
  State<ListCarona> createState() => _ListCaronaState();
}

class _ListCaronaState extends State<ListCarona> {
  List<Carona> _caronas = [];
  @override
  void initState() {
    _caronas = widget.caronas;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.reload,
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: widget.caronas.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.grey[300],
            title: Text(_caronas[index].nome),
            subtitle: Text("${_caronas[index].modelo} ${_caronas[index].cor}"),
            leading: Text("${_caronas[index].vagas} Vagas"),
            trailing: Text(
                "Incio: ${_caronas[index].inicio}\nFim: ${_caronas[index].fim}\nHorario: ${DateFormat.Hm().format(_caronas[index].horario)}"),
          );
        },
      ),
    );
  }
}
