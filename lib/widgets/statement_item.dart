import 'package:flutter/material.dart';
import 'package:flutter_dev/model/transfer.dart';
import 'package:intl/intl.dart';
import 'package:simple_currency_format/simple_currency_format.dart';

class StatementItem extends StatelessWidget {
  final Transaction transaction;

  const StatementItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    var title = transaction.type == TransferType.deposit
        ? "Depósito"
        : "Saque";
    var color = transaction.type == TransferType.deposit
        ? Colors.green
        : Colors.red;
    var icon = transaction.type == TransferType.deposit
        ? Icons.arrow_forward
        : Icons.arrow_back;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(title),
      subtitle: Text(
        currencyFormat(transaction.value),
        style: TextStyle(color: color),
      ),
      trailing: Text(
          DateFormat('dd/MM/yyyy HH:mm',"pt-BR").format(transaction.dateTime)
      ),
    );
  }
}
