import 'package:crypto_currency_wallet/account/account_data.dart';
import 'package:crypto_currency_wallet/navigator/screens.dart';
import 'package:crypto_currency_wallet/widgets/account_title.dart';
import 'package:crypto_currency_wallet/widgets/balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var filterApplied = false;

  @override
  Widget build(BuildContext context) {
    var data = mockAccount();
    if (filterApplied) {
      data = data.where((item) => double.parse(item.balance) > 0).toList();
    }
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            FilterCheckBox(
              checkBoxValue: filterApplied,
              onCheckChanged: _filterClicked,
            )
          ]..addAll(data
              .map((account) => AccountListItem(
                    accountData: account,
                  ))
              .toList()),
        ));
  }

  void _filterClicked() {
    setState(() {
      filterApplied = !filterApplied;
    });
  }
}

class FilterCheckBox extends StatelessWidget {
  final bool checkBoxValue;
  final Function onCheckChanged;

  const FilterCheckBox({
    Key key,
    this.checkBoxValue,
    this.onCheckChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Hide empty accounts"),
          Checkbox(
            value: checkBoxValue,
            onChanged: (changed) => onCheckChanged(),
          ),
        ],
      ),
    );
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
                child: Hero(
                  tag: accountData.currencyValue,
                  child: SvgPicture.network(
                    urlImageForCurrency(accountData.currencyValue),
                    placeholderBuilder: (context) =>
                        CircularProgressIndicator(),
                  ),
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
