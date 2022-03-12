import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gerenciamento_de_financas/Components/divider_with_text.dart';
import 'package:gerenciamento_de_financas/Components/form_transacao.dart';
import 'package:gerenciamento_de_financas/Components/transaction_card.dart';
import 'package:gerenciamento_de_financas/Components/chart.dart';

import 'models/transaction.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Finanças',
      home: const HomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Quicksand",
        appBarTheme: ThemeData().appBarTheme.copyWith(
          brightness: Brightness.dark,
          titleTextStyle: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 22,
            fontWeight: FontWeight.bold
          )
        ),
        primaryColor: Colors.indigo[900],
        colorScheme: Theme.of(context).colorScheme.copyWith(
            brightness: Brightness.dark,
            primary: Colors.indigo.shade900,
            secondary: Colors.indigoAccent,
        )
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _transactions = <Transaction>[
    Transaction(id: 1, nome: "SEILA", valor: 1500, data: DateTime.now().subtract(Duration(days:1))),
    Transaction(id: 2, nome: "OUTRA COISA", valor: 720, data: DateTime.now().subtract(Duration(days:2))),
  ];

  List<Transaction> get _recentTransactions =>
    _transactions.where((element) => element.data.isAfter(DateTime.now().subtract(Duration(days: 7)))).toList();
  

  void _openForm(BuildContext context){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx){
        return FormTransacao(submit: _addTransaction);
      }
    );
  }

  void _addTransaction(String? nome, String? valor, bool entrada, DateTime data, BuildContext context){
    nome = nome ?? "";
    valor = valor ?? "0";
    if(nome.trim() == "" || valor == "0"){
      Navigator.of(context).pop();
      return;
    }

    var id = 0;
    do {
      id = Random().nextInt(10 * 10 * 10 * 10 * 10);
    }while(_transactions.where((element) => element.id == id).isNotEmpty);

    _transactions.add(Transaction(id: id, nome: nome, valor: double.parse(valor), data: data, entrada: entrada));
    setState(() {});

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        elevation: 10,
        actions: [
          IconButton(
              onPressed: () => _openForm(context),
              icon: const Icon(Icons.add, color: Colors.white))
        ],
        title: const Text(
          "Finanças",
          style: TextStyle(color: Colors.white),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          //Card(child: Container(child: const Text("Grupo"), padding: const EdgeInsets.all(10), alignment: Alignment.center), elevation: 10), //AONDE VAI TA A TABELA BONITA
          Chart(recentTransactions: _recentTransactions),
          const DividerWithText(text: "Lista de Transações"),
          Expanded(
            child: _transactions.isEmpty 
            ? Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset("assets/images/waiting.png",
                color: Colors.white,
              ),
            )
            : ListView.builder(
              itemCount: _transactions.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (ctx, index) => Dismissible(
                  key: Key(_transactions[index].id.toString()),
                  child: TransactionCard(transacao:_transactions[index]),
                  onDismissed: (_) {
                    _transactions.removeAt(index);
                    setState((){});
                  },
              )
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.indigoAccent,
        onPressed: () => _openForm(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
