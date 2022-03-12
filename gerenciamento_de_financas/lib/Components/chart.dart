import 'package:flutter/material.dart';
import 'package:gerenciamento_de_financas/models/transaction.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

class Chart extends StatefulWidget {
  final List<Transaction> recentTransactions;
  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  Map<String, double> get groupedTransactions {
    Map<String,double>  resultado = {};
    for(int i = 0; i < 7; i++){
      final WDF = DateTime.now().subtract(Duration(days: i)); //Week Day Full
      final weekDay = DateFormat.E().format(WDF);

      double totalSum = widget.recentTransactions
          .where((element) => WDF.day == element.data.day && element.data.year == WDF.year && element.data.month == WDF.month)
          .map((e) => e.entrada ? e.valor * -1 : e.valor)
          .fold(0, (previousValue, element) => element+previousValue);

      //print("VALOR -> " + weekDay + totalSum.toString() + "\n");

      resultado[weekDay] = totalSum >= 0 ? totalSum : 0;
    }

    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    final size = groupedTransactions.length;
    final total = groupedTransactions.values.fold<double>(0, (prev, element) => prev + element);

    final week = groupedTransactions.keys.toList().map((e) =>
        Column(
          children:[
            Text(e),
            Text("R\$${groupedTransactions[e].toString()}", style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
            ChartBar(value: groupedTransactions[e]!, total: total)
          ]
        )
    );

    return Card(
      elevation: 6,
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...week
          ],
        ),
      )
    );
  }
}
