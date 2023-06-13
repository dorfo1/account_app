import 'package:flutter/material.dart';
import 'package:flutter_dev/model/account.dart';
import 'package:flutter_dev/model/transfer.dart';
import 'package:flutter_dev/widgets/statement_item.dart';

class AccountHomeStatement extends StatelessWidget {
  final Account account;
  final Function onSeeTransactionsClicked;

  const AccountHomeStatement({
    super.key,
    required this.account,
    required this.onSeeTransactionsClicked,
  });

  @override
  Widget build(BuildContext context) {
    if (account.transfers.isEmpty) {
      return Container();
    } else {
      var lastElements = takeLastThree(account.transfers);
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Ultimas movimentações",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () => onSeeTransactionsClicked(),
                child: const Text(
                  "Ver todas",
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: lastElements.length,
            itemBuilder: (context, index) => StatementItem(
              transaction: lastElements[index],
            ),
          )
        ],
      );
    }
  }

  List<Transaction> takeLastThree(List<Transaction> transfers) {
    if(transfers.length < 3) {
      return transfers.reversed.toList();
    } else  {
      return transfers.sublist(transfers.length - 3).reversed.toList();
    }
  }
}
