class Transaction {
  final String amount;
  String balance;
  String description;
  String id;
  String status;
  final String type;
  final DateTime date;

  Transaction(
      {this.amount,
      this.type,
      this.date,
      this.id,
      this.status,
      this.balance,
      this.description});
}

List<Transaction> mockTransactions() => [
      Transaction(
          amount: "6",
          type: "RECEIVE",
          date: DateTime.now().subtract(Duration(hours: 56))),
      Transaction(
          amount: "6",
          type: "RECEIVE",
          date: DateTime.now().subtract(Duration(hours: 44))),
      Transaction(
          amount: "-6",
          type: "RECEIVE",
          date: DateTime.now().subtract(Duration(hours: 32))),
      Transaction(
          amount: "2",
          type: "RECEIVE",
          date: DateTime.now().subtract(Duration(hours: 12))),
      Transaction(
          amount: "-12",
          type: "SEND",
          date: DateTime.now().subtract(Duration(hours: 5))),
      Transaction(
          amount: "6",
          type: "RECEIVE",
          date: DateTime.now().subtract(Duration(hours: 4))),
      Transaction(
          amount: "-3",
          type: "SEND",
          date: DateTime.now().subtract(Duration(hours: 3))),
      Transaction(
          amount: "5",
          type: "RECEIVE",
          date: DateTime.now().subtract(Duration(hours: 2))),
      Transaction(amount: "-5", type: "SEND", date: DateTime.now()),
    ];
