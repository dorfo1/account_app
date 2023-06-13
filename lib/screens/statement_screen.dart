import 'package:flutter/material.dart';
import 'package:flutter_dev/model/transfer.dart';
import 'package:flutter_dev/widgets/statement_item.dart';

class StatementScreen extends StatelessWidget {
  final List<Transaction> transactions;

  const StatementScreen({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transações"),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    var reversedList = transactions.reversed.toList();
    if (reversedList.isEmpty) {
      return const Center(
        child: Text(
          "Nenhuma transação realizada",
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: reversedList.length,
        itemBuilder: (context, index) => StatementItem(
          transaction: reversedList[index],
        ),
      );
    }
  }
}
