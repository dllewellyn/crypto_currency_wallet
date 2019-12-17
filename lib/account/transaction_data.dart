
import 'package:json_annotation/json_annotation.dart';

part 'transaction_data.g.dart';

@JsonSerializable()
class Transaction {
  final String amount;
  String balance;
  String description;
  String id;
  String status;
  final String type;
  final String date;

  Transaction(
      {this.amount,
        this.type,
        this.date,
        this.id,
        this.status,
        this.balance,
        this.description});

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}


List<Transaction> mockTransactions() => [
  Transaction(
    amount: "0.0047768600000000",
    type: "Send",
    id: "Iasdasd",
    balance: "0.0047768600000000",
    date: "2019-06-17T07:36:55.409089Z",
    description: "Description",
    status: "SENT"
  )
];
