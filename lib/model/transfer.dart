class Transaction {
  double value;
  TransferType type;
  DateTime dateTime;

  Transaction({
    required this.value,
    required this.type,
  }) : dateTime = DateTime.now();
}

enum TransferType { deposit, withdrawn }
