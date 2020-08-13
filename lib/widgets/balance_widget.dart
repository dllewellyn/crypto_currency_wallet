import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BalanceWidget extends StatelessWidget {
  final String balance;

  const BalanceWidget({Key key, this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      balance,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
