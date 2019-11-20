import 'package:crypto_currency_wallet/account/account_data.dart';
import 'package:crypto_currency_wallet/account/transaction_data.dart';
import 'package:flutter/material.dart';

class TransactionListScreen extends StatelessWidget {
  final AccountData accountData;

  const TransactionListScreen({Key key, @required this.accountData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (accountData.transactions.isEmpty) {
      widget = Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Text(
          "You don't have any transactions for this account",
          style: Theme.of(context).textTheme.title,
          textAlign: TextAlign.center,
        )),
      );
    } else {
      widget = Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          children: accountData.transactions
              .map((transaction) => TransactionListItem(
                    transaction: transaction,
                  ))
              .toList(),
        ),
      );
    }

    return Scaffold(appBar: AppBar(), body: Container(child: widget));
  }
}

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionListItem({Key key, @required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        transaction.amount,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
