import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_data.g.dart';

@JsonSerializable()
class Transaction extends Equatable {
  final String amount;
  String balance;
  String description;
  String id;
  String status;
  final String nativeCurrency;
  final String nativeAmount;
  final String dollarValue;
  final String type;
  final String date;

  DateTime get dateTime => DateTime.parse(date);

  Transaction(
      {this.amount,
      this.type,
      this.date,
      this.id,
      this.status,
      this.balance,
      this.description,
      this.nativeCurrency,
      this.nativeAmount,
      this.dollarValue});

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  @override
  List<Object> get props => [this.id];
}

List<Transaction> mockTransactions() => [
      Transaction(
          nativeCurrency: "GBP",
          nativeAmount: "100",
          dollarValue: "80",
          amount: "0.0047768600000000",
          type: "Send",
          id: "Iasdasd",
          balance: "0.0047768600000000",
          date: "2019-06-17T07:36:55.409089Z",
          description: "Description",
          status: "SENT")
    ];
