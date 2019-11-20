import 'package:crypto_currency_wallet/screens/home_screen.dart';
import 'package:crypto_currency_wallet/screens/transaction_list_screen.dart';
import 'package:flutter/material.dart';

import 'navigator/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "/",
      onGenerateRoute: (settings) {
        Widget widget;

        if (settings.name == HOME_SCREEN) {
          widget = MyHomePage();
        } else if (settings.name == DETAIL_SCREEN) {
          widget = TransactionListScreen(accountData: settings.arguments);
        }

        return MaterialPageRoute(builder: (context) => widget);
      },
      theme: ThemeData(
          splashColor: Colors.redAccent,
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
    );
  }
}
