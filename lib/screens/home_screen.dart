import 'package:crypto_currency_wallet/account/account_data.dart';
import 'package:crypto_currency_wallet/navigator/screens.dart';
import 'package:crypto_currency_wallet/widgets/account_title.dart';
import 'package:crypto_currency_wallet/widgets/balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(DETAIL_SCREEN, arguments: accountData),
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
      ),
    );
  }
}
