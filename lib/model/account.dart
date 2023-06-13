import 'package:flutter_dev/model/transfer.dart';
import 'package:flutter_dev/model/user.dart';

class Account {
  String branch;
  String account;
  User user;
  List<Transaction> transfers;
  double balance;
  double limit;

  Account({
    required this.branch,
    required this.account,
    required this.user,
    required this.transfers,
    required this.balance,
    required this.limit,
  });

  void withdrawn(double amount) {
    transfers.add(Transaction(value: amount, type: TransferType.withdrawn));
    balance -= amount;
  }

  void deposit(double amount) {
    transfers.add(Transaction(value: amount, type: TransferType.deposit));
    balance += amount;
  }
}
