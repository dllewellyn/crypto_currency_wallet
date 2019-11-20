import 'package:crypto_currency_wallet/account/account_data.dart';
import 'package:crypto_currency_wallet/widgets/account_title.dart';
import 'package:crypto_currency_wallet/widgets/balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: "stonehenge",
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
            caption: TextStyle(
              fontFamily: "stonehenge",
              fontSize: 18,
            ),
            headline: TextStyle(
              fontFamily: "carolingia",
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: mockAccount()
              .map((account) => AccountListItem(
                    accountData: account,
                  ))
              .toList(),
        ));
  }
}

class AccountListItem extends StatelessWidget {
  final AccountData accountData;

  const AccountListItem({Key key, this.accountData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.network(
                urlImageForCurrency(accountData.currencyValue),
                placeholderBuilder: (context) => CircularProgressIndicator(),
              ),
            ),
            AccountTitle(
              supportedCurrency: accountData.currencyValue,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BalanceWidget(
                balance: accountData.balance,
              ),
            )
          ],
        ),
      ),
    );
  }
}
