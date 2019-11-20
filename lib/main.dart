import 'package:crypto_currency_wallet/account/transaction_data.dart';
import 'package:crypto_currency_wallet/screens/transaction_screen.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

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

        if (settings.name == "/") {
          widget = MyHomePage();
        } else if (settings.name == "/detail") {
          widget = TransactionScreen(
            transactions: settings.arguments as List<Transaction>,
          );
        }

        return MaterialPageRoute(builder: (_) => widget);
      },
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
    );
  }
}
