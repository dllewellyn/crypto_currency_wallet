import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountTitle extends StatelessWidget {
  final String supportedCurrency;

  const AccountTitle({@required this.supportedCurrency});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          supportedCurrency,
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}
