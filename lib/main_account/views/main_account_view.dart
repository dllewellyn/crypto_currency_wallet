import 'package:crypto_currency_wallet/account/account_data.dart';
import 'package:crypto_currency_wallet/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';
import '../main_account.dart';

class MainAccountView extends StatefulWidget {
  @override
  _MainAccountViewState createState() => _MainAccountViewState();
}

class _MainAccountViewState extends State<MainAccountView> {
  var filterApplied = false;

  @override
  Widget build(BuildContext context) {
    var data = mockAccount();
    if (filterApplied) {
      data = data.where((item) => double.parse(item.balance) > 0).toList();
    }
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: ClearAppBar(),
        body: Stack(
          children: [
            ListView(
              children: data
                  .map((account) => AccountListItem(
                        accountData: account,
                      ))
                  .toList(),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              maxChildSize: 0.9,
              minChildSize: 0.1,
              builder: (context, scroll) => Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    TouchIndicator(),
                    FilterCheckBox(
                      checkBoxValue: filterApplied,
                      onCheckChanged: _filterClicked,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void _filterClicked() {
    setState(() {
      filterApplied = !filterApplied;
    });
  }
}
