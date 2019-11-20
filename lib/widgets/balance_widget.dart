import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BalanceWidget extends StatelessWidget {
  final double balance;

  const BalanceWidget({Key key, this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      balance.toString(),
      style: Theme.of(context).textTheme.headline,
    );
  }
}
