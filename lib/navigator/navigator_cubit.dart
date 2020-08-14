import 'package:bloc/bloc.dart';
import 'package:crypto_currency_wallet/account/account_data.dart';
import 'package:crypto_currency_wallet/main_account/views/main_account_view.dart';
import 'package:crypto_currency_wallet/transaction_list/views/transaction_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'navigator_state.dart';

class NavigatorCubit extends Cubit<NavState> {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigatorCubit(this.navigatorKey) : super(NavigatorInitial());

  void pushHomeScreen() {
    navigatorKey.currentState
        .push(MaterialPageRoute(builder: (context) => MainAccountView()));
  }

  void pushAccountDetailScreen(AccountData accountData) {
    navigatorKey.currentState.push(MaterialPageRoute(
        builder: (context) => TransactionListScreen(
              accountData: accountData,
            )));
  }
}
