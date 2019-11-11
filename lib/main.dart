import 'package:crypto_currency_wallet/account/account_data.dart';
import 'package:crypto_currency_wallet/widgets/account_title.dart';
import 'package:crypto_currency_wallet/widgets/balance_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AccountListItem(
        accountData: mockAccount(),
      ),
    );
  }
}

class AccountListItem extends StatelessWidget {
  final AccountData accountData;

  const AccountListItem({Key key, this.accountData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountTitle(supportedCurrency: accountData.currencyValue),
          Spacer(),
          BalanceWidget(
            balance: accountData.balance,
          )
        ],
      ),
    );
  }
}
