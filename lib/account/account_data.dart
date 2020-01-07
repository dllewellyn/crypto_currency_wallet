import 'package:crypto_currency_wallet/account/transaction_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_data.g.dart';

@JsonSerializable()
class AllUserDetails {
  final List<AccountData> accounts;

  AllUserDetails({this.accounts});

  factory AllUserDetails.fromJson(Map<String, dynamic> json) =>
      _$AllUserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AllUserDetailsToJson(this);
}

@JsonSerializable()
class AccountData {
  final String key;
  final String currencyValue;
  final String balance;
  final String uid;
  final String provider;
  List<Transaction> transactions;

  AccountData(
      {this.currencyValue,
        this.balance,
        this.uid,
        this.provider,
        this.key,
        this.transactions});

  factory AccountData.fromJson(Map<String, dynamic> json) =>
      _$AccountDataFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDataToJson(this);
}



String urlImageForCurrency(String currency) {
  return "https://coinbaseliveexchange.appspot.com/currencies/image/" +
      currency;
}

List<AccountData> mockAccount() => [
  AccountData(
      key: "Test data",
      balance: "0.0034860113",
      currencyValue: "BTC",
      provider: "coinbase",
      transactions: mockTransactions(),
      uid: "123123"),
  AccountData(
      key: "Test data2",
      balance: "100",
      currencyValue: "Eth",
      provider: "coinbase",
      transactions: [],
      uid: "123123")
];
