import 'package:flutter/material.dart';
import 'package:simple_currency_format/simple_currency_format.dart';

class AccountBalanceCard extends StatelessWidget {
  final double balance;
  final bool showBalance;
  final double totalLimit;
  final Function(bool showBalance) onVisibilityChanged;

  const AccountBalanceCard({
    Key? key,
    required this.balance,
    required this.showBalance,
    required this.totalLimit,
    required this.onVisibilityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var icon = showBalance ? Icons.visibility : Icons.visibility_off;
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () { onVisibilityChanged(showBalance);},
                  child: Icon(icon),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text("Saldo em conta"),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              showBalance ? currencyFormat(balance) : "*****",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepOrange[900]),
            ),
            const Divider(),
            Text("Limite total em conta ${currencyFormat(totalLimit)}")
          ],
        ),
      ),
    );
  }
}
