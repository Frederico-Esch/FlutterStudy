import 'package:flutter/material.dart';
import 'package:gerenciamento_de_financas/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transacao;

  const TransactionCard({Key? key, required this.transacao}) : super(key: key);

  double calculateRadius(String content) => (content.length + 3 + 4) * 3;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: CircleAvatar(
                child: Text("R\$ ${transacao.valor.toStringAsFixed(2)}", style: const TextStyle(color: Colors.white)),
                backgroundColor: Colors.indigo[900],
                radius: calculateRadius(transacao.valor.toStringAsFixed(2)),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                boxShadow:
                transacao.entrada
                    ?
                [BoxShadow(
                  color:  Colors.indigo.shade900,
                  blurRadius: 15,
                  spreadRadius: 2
                )]
                    :
                [BoxShadow(
                  color: Colors.indigoAccent.shade100,
                  blurRadius: 12,
                  spreadRadius: 0.5
                )]
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(transacao.nome,
                      style: transacao.entrada ? const TextStyle(fontSize: 20, color: Colors.black) : const TextStyle(fontSize: 20, color: Colors.white)
                  ),
                  Text(DateFormat('d MMM').format(transacao.data),
                      style: transacao.entrada ? TextStyle(fontSize: 18, color: Colors.grey[700]) : TextStyle(fontSize: 18, color: Colors.grey[400])
                  )
                ],
              ),
            )
          ],
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: transacao.entrada ? Colors.greenAccent[700] : Colors.red),
      ),
      elevation: 10,
      color: Colors.transparent,
    );
  }
}
