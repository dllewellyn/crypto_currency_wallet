import 'package:crypto_currency_wallet/main_account/views/main_account_view.dart';
import 'package:crypto_currency_wallet/navigator/navigator_cubit.dart';
import 'package:crypto_currency_wallet/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crypto_repository/crypto_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<WalletRepository>(
            create: (_) => DefaultRemoteRepository(),
          )
        ],
        child: BlocProvider.value(
            value: NavigatorCubit(_navigatorKey), child: MainAccountView()),
      ),
      theme: ThemeData(
          textTheme: TextTheme(
        bodyText1: GoogleFonts.nunito(),
        bodyText2: GoogleFonts.nunito(),
        headline6: GoogleFonts.nunito(
          fontWeight: FontWeight.bold,
          color: primaryTextColor,
          fontSize: 26,
        ),
        caption: GoogleFonts.nunito(
          color: primaryTextColor,
          fontSize: 18,
        ),
        headline1: GoogleFonts.nunito(
          color: primaryTextColor,
          fontSize: 26,
        ),
      )),
    );
  }
}
