import 'package:crypto_currency_wallet/account/account_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountTitle extends StatelessWidget {
  final SupportedCurrency supportedCurrency;

  const AccountTitle({@required this.supportedCurrency});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          supportedCurrency.name,
          style: Theme.of(context).textTheme.title,
        ),
        Text(
          supportedCurrency.id,
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}
