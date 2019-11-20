import 'package:crypto_currency_wallet/account/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionScreen extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionScreen({Key key, @required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (transactions.isEmpty) {
      widget = Padding(
        padding: const EdgeInsets.all(22.0),
        child: Center(
            child: Text(
          "No transactions for this account",
          style: Theme.of(context).textTheme.title,
        )),
      );
    } else {
      widget = ListView(
          children: transactions
              .map((transaction) =>
                  TransactionListItem(transaction: transaction))
              .toList());
    }

    return Scaffold(
      appBar: AppBar(),
      body: widget,
    );
  }
}

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionListItem({Key key, @required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(transaction.amount);
  }
}
