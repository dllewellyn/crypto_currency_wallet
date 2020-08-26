import 'package:crypto_currency_wallet/extensions/displayable_price.dart';
import 'package:crypto_currency_wallet/navigator/navigator_cubit.dart';
import 'package:crypto_currency_wallet/widgets/account_title.dart';
import 'package:crypto_currency_wallet/widgets/balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:crypto_repository/crypto_repository.dart';

class AccountListItem extends StatelessWidget {
  final AccountData accountData;

  const AccountListItem({Key key, this.accountData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => BlocProvider.of<NavigatorCubit>(context)
          .pushAccountDetailScreen(accountData),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Hero(
                tag: accountData.currencyValue,
                child: SvgPicture.network(
                  urlImageForCurrency(accountData.currencyValue),
                  placeholderBuilder: (context) => CircularProgressIndicator(),
                ),
              ),
            ),
            AccountTitle(
              supportedCurrency: accountData.currencyValue,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BalanceWidget(
                balance: Utils.toDisplayablePrice(accountData.balance),
              ),
            )
          ],
        ),
      ),
    );
  }
}
