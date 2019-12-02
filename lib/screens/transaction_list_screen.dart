import 'package:crypto_currency_wallet/account/account_data.dart';
import 'package:crypto_currency_wallet/account/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionListScreen extends StatelessWidget {
  final AccountData accountData;

  const TransactionListScreen({Key key, @required this.accountData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widget;

    var heroWidget = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Hero(
        tag: accountData.currencyValue.id,
        child: SvgPicture.network(
          urlImageForCurrency(accountData.currencyValue),
          placeholderBuilder: (context) => CircularProgressIndicator(),
          height: 60,
          width: 60,
        ),
      ),
    );

    if (accountData.transactions.isEmpty) {
      widget = [
        heroWidget,
        Center(
            child: Text(
          "You don't have any transactions for this account",
          style: Theme.of(context).textTheme.title,
          textAlign: TextAlign.center,
        ))
      ];
    } else {
      widget = [heroWidget]..addAll(accountData.transactions
          .map((transaction) => TransactionListItem(
                transaction: transaction,
              ))
          .toList());
    }

    return Scaffold(
        appBar: AppBar(), body: Container(child: ListView(children: widget)));
  }
}

class TransactionListItem extends StatefulWidget {
  final Transaction transaction;

  const TransactionListItem({Key key, @required this.transaction})
      : super(key: key);

  @override
  _TransactionListItemState createState() => _TransactionListItemState();
}

class _TransactionListItemState extends State<TransactionListItem> with TickerProviderStateMixin {
  Animation<Color> _animation;
  AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = ColorTween(begin: Colors.black,
       end: double.parse(widget.transaction.amount) > 0 ? Colors.green : Colors.red,
    ).animate(_controller)..addListener(() {
      setState((){});
    });
    // Tell the animation to start
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(side: BorderSide(color: _animation.value), borderRadius: BorderRadius.all(Radius.circular(9))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Text(
              widget.transaction.date,
              style: Theme.of(context).textTheme.body1
            ),
            Spacer(),
            Text(
              widget.transaction.amount,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
