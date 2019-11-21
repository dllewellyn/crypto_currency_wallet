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
}

List<Transaction> mockTransactions() => [
      Transaction(amount: "5", type: "SEND", date: "20/11/19 19:27"),
      Transaction(amount: "-5", type: "SEND", date: "20/11/19 19:28"),
    ];
