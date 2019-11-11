import 'package:crypto_currency_wallet/account/account_data.dart';
import 'package:flutter/widgets.dart';

class AccountTitle extends StatelessWidget {
  final SupportedCurrency supportedCurrency;

  const AccountTitle({@required this.supportedCurrency});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(supportedCurrency.name),
        Text(supportedCurrency.id)
      ],
    );
  }
}
