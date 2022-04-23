import 'package:flutter/foundation.dart';
import 'package:want_2_kick/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = [
    Transaction(title: 'StadiumA', amount: 500, date: DateTime.now()),
    Transaction(title: 'StadiumB', amount: 400, date: DateTime.now()),
    Transaction(title: 'StadiumC', amount: 300, date: DateTime.now())
  ];

  List<Transaction> getTransaction() {
    return transactions;
  }

  void addTransaction(Transaction statement) {
    transactions.add(statement);
  }
}
